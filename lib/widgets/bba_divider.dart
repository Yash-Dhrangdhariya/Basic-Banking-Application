import 'package:flutter/material.dart';

import '../resource/app_colors.dart';

class BbaDivider extends StatelessWidget {
  const BbaDivider({
    this.color = AppColors.divider,
    this.height,
    this.thickness = 6,
    this.margin = EdgeInsets.zero,
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
