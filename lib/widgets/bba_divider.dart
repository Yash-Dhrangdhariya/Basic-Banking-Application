import 'package:flutter/material.dart';

import '../resource/app_colors.dart';

class BbaDivider extends StatelessWidget {
  const BbaDivider({
    this.color = AppColors.secondary,
    this.margin = EdgeInsets.zero,
    this.thickness = 2,
    this.height,
    super.key,
  });

  final Color color;
  final double? height;
  final double thickness;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Divider(
        color: color,
        height: height,
        thickness: thickness,
      ),
    );
  }
}
