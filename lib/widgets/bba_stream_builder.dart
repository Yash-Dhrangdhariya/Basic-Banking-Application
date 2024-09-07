import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../utils/extensions.dart';
import '../values/typedefs.dart';
import 'bba_error.dart';
import 'bba_loading.dart';

class BbaStreamBuilder<T> extends StatelessObserverWidget {
  const BbaStreamBuilder({
    required this.stream,
    required this.onSuccess,
    required this.onNoData,
    this.onLoading = const BbaLoading(),
    this.onError = const BbaError(),
    this.fakeData,
    super.key,
  });

  final Widget onLoading;
  final BbaStreamBuilderSuccessWidget<T> onSuccess;
  final Widget onNoData;
  final Widget onError;
  final ObservableStream<T>? stream;

  // This is for skeletonizer
  final T? fakeData;

  @override
  Widget build(BuildContext context) {
    if (stream == null) return onLoading;
    if (stream?.status.isWaiting ?? false) {
      return fakeData is T ? onSuccess(fakeData as T) : onLoading;
    } else if (stream?.hasError ?? false) {
      log('Error: ${stream?.error}', name: 'Stream<${T.runtimeType}>');
      return onError;
    } else {
      final value = stream?.value;
      if (value == null) return onNoData;
      if (value is List) {
        if (value.isEmpty) return onNoData;
      }
      return onSuccess(value);
    }
  }
}
