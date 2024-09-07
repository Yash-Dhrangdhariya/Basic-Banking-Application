import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../utils/snackbar_service.dart';
import '../utils/theme/app_theme.dart';
import '../values/app_strings.dart';

class BasicBankingApp extends StatelessWidget {
  const BasicBankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      scaffoldMessengerKey: SnackBarService.key,
    );
  }
}
