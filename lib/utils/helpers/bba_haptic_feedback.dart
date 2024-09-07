import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

import 'device_info_helper.dart';

class BbaHapticFeedback {
  const BbaHapticFeedback._();

  static bool get _isSamsungDevice => DeviceInfoHelper.isSamsungDevice;

  static void lightImpact() {
    _isSamsungDevice
        ? Vibration.vibrate(duration: 4, amplitude: 255).ignore()
        : HapticFeedback.lightImpact().ignore();
  }

  static void mediumImpact() {
    _isSamsungDevice
        ? Vibration.vibrate(
            duration: 10,
            amplitude: 255,
          ).ignore()
        : HapticFeedback.mediumImpact().ignore();
  }

  static void heavyImpact() {
    _isSamsungDevice
        ? Vibration.vibrate(
            duration: 20,
            amplitude: 255,
          ).ignore()
        : HapticFeedback.heavyImpact().ignore();
  }
}
