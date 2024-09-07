import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../resource/app_colors.dart';
import '../utils/extensions.dart';

class BbaLoading extends StatelessWidget {
  const BbaLoading({
    this.indicatorColor = AppColors.black,
    this.iosIndicatorRadius = AppConstants.iosDefaultIndicatorRadius,
    this.message,
    this.style,
    this.padding = EdgeInsets.zero,
    this.androidIndicatorStrokeWidth =
        AppConstants.androidDefaultIndicatorStrokeWidth,
    super.key,
    this.widthFactor,
    this.heightFactor,
  });

  final String? message;
  final TextStyle? style;
  final Color indicatorColor;
  final double iosIndicatorRadius;
  final double androidIndicatorStrokeWidth;
  final EdgeInsets padding;
  final double? widthFactor;
  final double? heightFactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (message != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppConstants.appPadding),
                child: Text(
                  message!,
                  style: style,
                ),
              ),
            Flexible(
              child: RepaintBoundary(
                child: switch (context.currentPlatform) {
                  TargetPlatform.iOS ||
                  TargetPlatform.macOS =>
                    CupertinoActivityIndicator(
                      color: indicatorColor,
                      radius: iosIndicatorRadius,
                    ),
                  _ => CircularProgressIndicator(
                      color: indicatorColor,
                      strokeWidth: androidIndicatorStrokeWidth,
                    ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
