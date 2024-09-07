import 'package:flutter/material.dart';

import '../../resource/app_colors.dart';
import '../../resource/app_text_styles.dart';
import '../../resources/resources.dart';

class AppTheme {
  const AppTheme._();

  static final light = ThemeData(
    useMaterial3: true,
    fontFamily: FontFamily.regular,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: AppTextStyles.appBar,
      backgroundColor: Colors.transparent,
    ),
    dialogTheme: const DialogTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.text,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    bottomNavigationBarTheme: bottomNavigationBarTheme,
  );

  static const bottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.background,
    showSelectedLabels: false,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: false,
    unselectedItemColor: AppColors.primary,
  );
}
