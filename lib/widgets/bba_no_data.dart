import 'package:flutter/material.dart';

import '../values/app_strings.dart';

class BbaNoData extends StatelessWidget {
  const BbaNoData({
    this.title = AppStrings.noDataFound,
    this.heightFactor = 10,
    this.textAlign = TextAlign.center,
    this.alignment = Alignment.center,
    this.widthFactor,
    this.style,
    super.key,
  });

  final String title;
  final TextStyle? style;
  final double? heightFactor;
  final double? widthFactor;
  final TextAlign textAlign;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: Text(
        title,
        textAlign: textAlign,
        style: style,
      ),
    );
  }
}
