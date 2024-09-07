import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle appBar = TextStyle(
    fontSize: 24,
    color: AppColors.text,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle dialogTitle = TextStyle(
    fontSize: 24,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle dialogDescription = TextStyle(
    fontSize: 16,
    color: AppColors.grey,
  );

  static const TextStyle dropdownStyle = TextStyle(
    color: AppColors.black,
  );

  static const TextStyle dropdownHintStyle = TextStyle(
    fontSize: 16,
    color: AppColors.dropdownHintText,
  );
}
