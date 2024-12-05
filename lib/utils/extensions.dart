import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../resource/app_text_styles.dart';
import 'theme/app_text_theme.dart';

extension BuildContextExtension on BuildContext {
  TargetPlatform get currentPlatform => Theme.of(this).platform;

  AppTextTheme get appText =>
      Theme.of(this).extension<AppTextTheme>() ?? AppTextStyles.lightAppText;
}

extension StreamStatusExtension on StreamStatus {
  bool get isWaiting => this == StreamStatus.waiting;

  bool get isActive => this == StreamStatus.active;

  bool get isDone => this == StreamStatus.done;
}
