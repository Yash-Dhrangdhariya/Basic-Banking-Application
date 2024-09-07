import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../../values/app_strings.dart';

class DeviceInfoHelper {
  const DeviceInfoHelper._();

  static final _deviceInfoPlugin = DeviceInfoPlugin();

  static String _androidDeviceBrandName = AppStrings.kEmpty;

  static String get androidDeviceBrandName => _androidDeviceBrandName;

  static bool get isSamsungDevice => _androidDeviceBrandName
      .trim()
      .toLowerCase()
      .contains(AppStrings.samsungBrandName);

  static Future<void> setDeviceBrandName() async {
    if (!Platform.isAndroid) return;

    try {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      _androidDeviceBrandName = androidInfo.brand;
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'DeviceInfoHelper.setDeviceBrandName',
      );
    }
  }
}
