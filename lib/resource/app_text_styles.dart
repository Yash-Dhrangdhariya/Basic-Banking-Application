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
    color: AppColors.primary,
  );

  static const TextStyle dropdownStyle = TextStyle(color: AppColors.text);

  static const TextStyle dropdownHintStyle = TextStyle(
    fontSize: 16,
    color: AppColors.dropdownHintText,
  );

  static const TextStyle sortByTitle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    fontSize: 16,
  );

  static const TextStyle clearAll = TextStyle(
    color: Colors.redAccent,
    fontSize: 16,
  );

  static const TextStyle dropdownTitle = TextStyle(
    color: Colors.black,
    fontSize: 16,
  );

  static const TextStyle error = TextStyle(
    fontSize: 16,
    color: AppColors.primary,
  );
}
