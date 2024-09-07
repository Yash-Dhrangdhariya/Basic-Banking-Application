import 'dart:ui';

import 'package:flutter/material.dart';

import '../resource/app_colors.dart';

class CustomTextFieldContainer extends StatelessWidget {
  const CustomTextFieldContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: AppColors.textFieldBackground,
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: Align(child: child),
        ),
      ),
    );
  }
}
