import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/basic_banking_app.dart';
import 'firebase_options.dart';
import 'resource/app_colors.dart';
import 'utils/helpers/device_info_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: AppColors.background),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DeviceInfoHelper.setDeviceBrandName();
  runApp(ModularApp(module: AppModule(), child: const BasicBankingApp()));
}
