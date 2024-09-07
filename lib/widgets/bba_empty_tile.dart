import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_constants.dart';
import '../resource/app_colors.dart';

class BbaEmptyTile extends StatelessWidget {
  const BbaEmptyTile({
    required this.icon,
    required this.title,
    this.description,
    this.iconSize = 64,
    this.textSpacing = 8,
    this.child,
    this.heightFactor,
    this.widthFactor,
    super.key,
  });

  final String icon;
  final double iconSize;
  final String title;
  final String? description;
  final double textSpacing;
  final Widget? child;
  final double? heightFactor;
  final double? widthFactor;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: iconSize,
            width: iconSize,
          ),
          const SizedBox(height: AppConstants.appPadding),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (description?.isNotEmpty ?? false) ...[
            SizedBox(height: textSpacing),
            Text(
              description!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.primary,
              ),
            ),
          ],
          if (child != null) ...[
            const SizedBox(height: 24),
            child!,
          ],
        ],
      ),
    );
  }
}
