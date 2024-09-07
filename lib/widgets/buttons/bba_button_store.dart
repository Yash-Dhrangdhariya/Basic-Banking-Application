import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../../utils/helpers/bba_haptic_feedback.dart';

part 'bba_button_store.g.dart';

class BbaButtonStore = _BbaButtonStore with _$BbaButtonStore;

abstract class _BbaButtonStore with Store {
  @observable
  bool isLoading = false;

  FutureOr<void> onTap({
    ValueGetter<FutureOr<void>>? callback,
    bool loading = false,
  }) async {
    if (callback != null && !loading) {
      try {
        isLoading = true;
        BbaHapticFeedback.mediumImpact();
        await callback.call();
        isLoading = false;
      } catch (e) {
        isLoading = false;
        rethrow;
      }
    }
  }
}
