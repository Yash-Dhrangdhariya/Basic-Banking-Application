import 'package:flutter/material.dart';

import '../utils/theme/app_text_size.dart';
import '../utils/theme/app_text_theme.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

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

  static const lightAppText = AppTextTheme(
    largeTitle: TextStyle(
      fontSize: AppTextSize.largeTitle,
      color: AppColors.labelPrimary,
    ),
    sbLargeTitle: TextStyle(
      fontSize: AppTextSize.largeTitle,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    title1: TextStyle(
      fontSize: AppTextSize.title1,
      color: AppColors.labelPrimary,
    ),
    sbTitle1: TextStyle(
      fontSize: AppTextSize.title1,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    title2: TextStyle(
      fontSize: AppTextSize.title2,
      color: AppColors.labelPrimary,
    ),
    sbTitle2: TextStyle(
      fontSize: AppTextSize.title2,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    title3: TextStyle(
      fontSize: AppTextSize.title3,
      color: AppColors.labelPrimary,
    ),
    sbTitle3: TextStyle(
      fontSize: AppTextSize.title3,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    headline: TextStyle(
      fontSize: AppTextSize.headline,
      color: AppColors.labelPrimary,
    ),
    sbHeadline: TextStyle(
      fontSize: AppTextSize.headline,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    subHeadline: TextStyle(
      fontSize: AppTextSize.subHeadline,
      color: AppColors.labelPrimary,
    ),
    sbSubHeadline: TextStyle(
      fontSize: AppTextSize.subHeadline,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    body: TextStyle(
      fontSize: AppTextSize.body,
      color: AppColors.labelPrimary,
    ),
    sbBody: TextStyle(
      fontSize: AppTextSize.body,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    footnote: TextStyle(
      fontSize: AppTextSize.footnote,
      color: AppColors.labelPrimary,
    ),
    sbFootnote: TextStyle(
      fontSize: AppTextSize.footnote,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    caption1: TextStyle(
      fontSize: AppTextSize.caption1,
      color: AppColors.labelPrimary,
    ),
    sbCaption1: TextStyle(
      fontSize: AppTextSize.caption1,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
    caption2: TextStyle(
      fontSize: AppTextSize.caption2,
      color: AppColors.labelPrimary,
    ),
    sbCaption2: TextStyle(
      fontSize: AppTextSize.caption2,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimary,
    ),
  );

  static const darkAppText = AppTextTheme(
    largeTitle: TextStyle(
      color: AppColors.labelPrimaryDark,
      fontSize: AppTextSize.largeTitle,
    ),
    sbLargeTitle: TextStyle(
      fontSize: AppTextSize.largeTitle,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    title1: TextStyle(
      fontSize: AppTextSize.title1,
      color: AppColors.labelPrimaryDark,
    ),
    sbTitle1: TextStyle(
      fontSize: AppTextSize.title1,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    title2: TextStyle(
      fontSize: AppTextSize.title2,
      color: AppColors.labelPrimaryDark,
    ),
    sbTitle2: TextStyle(
      fontSize: AppTextSize.title2,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    title3: TextStyle(
      fontSize: AppTextSize.title3,
      color: AppColors.labelPrimaryDark,
    ),
    sbTitle3: TextStyle(
      fontSize: AppTextSize.title3,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    headline: TextStyle(
      fontSize: AppTextSize.headline,
      color: AppColors.labelPrimaryDark,
    ),
    sbHeadline: TextStyle(
      fontSize: AppTextSize.headline,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    subHeadline: TextStyle(
      fontSize: AppTextSize.subHeadline,
      color: AppColors.labelPrimaryDark,
    ),
    sbSubHeadline: TextStyle(
      fontSize: AppTextSize.subHeadline,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    body: TextStyle(
      fontSize: AppTextSize.body,
      color: AppColors.labelPrimaryDark,
    ),
    sbBody: TextStyle(
      fontSize: AppTextSize.body,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    footnote: TextStyle(
      fontSize: AppTextSize.footnote,
      color: AppColors.labelPrimaryDark,
    ),
    sbFootnote: TextStyle(
      fontSize: AppTextSize.footnote,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    caption1: TextStyle(
      fontSize: AppTextSize.caption1,
      color: AppColors.labelPrimaryDark,
    ),
    sbCaption1: TextStyle(
      fontSize: AppTextSize.caption1,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
    caption2: TextStyle(
      fontSize: AppTextSize.caption2,
      color: AppColors.labelPrimaryDark,
    ),
    sbCaption2: TextStyle(
      fontSize: AppTextSize.caption2,
      fontWeight: FontWeight.w600,
      color: AppColors.labelPrimaryDark,
    ),
  );
}
