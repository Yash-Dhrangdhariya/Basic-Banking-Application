import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

extension BuildContextExtension on BuildContext {
  TargetPlatform get currentPlatform => Theme.of(this).platform;
}

extension StreamStatusExtension on StreamStatus {
  bool get isWaiting => this == StreamStatus.waiting;

  bool get isActive => this == StreamStatus.active;

  bool get isDone => this == StreamStatus.done;
}
