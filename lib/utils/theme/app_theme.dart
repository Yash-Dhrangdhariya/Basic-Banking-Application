import 'package:flutter/cupertino.dart';
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
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: AppTextStyles.lightAppText.sbTitle1,
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
    cupertinoOverrideTheme: const CupertinoThemeData(
      barBackgroundColor: AppColors.background,
      primaryColor: AppColors.text,
    ),
  );

  static final bottomNavigationBarTheme = BottomNavigationBarThemeData(
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColors.background,
    unselectedItemColor: AppColors.primary,
    selectedLabelStyle: AppTextStyles.lightAppText.body,
  );
}
