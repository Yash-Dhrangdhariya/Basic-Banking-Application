import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resource/app_colors.dart';

class SnackBarService {
  const SnackBarService._();

  static final _key = GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get key => _key;

  static void showSnack(
    String message, {
    String? subMessage,
    String? icon,
  }) {
    _key.currentState
      ?..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    icon,
                    colorFilter: const ColorFilter.mode(
                      AppColors.background,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                      ),
                    ),
                    if (subMessage?.isNotEmpty ?? false) ...[
                      const SizedBox(height: 2),
                      Text(
                        subMessage!,
                        style: const TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.text,
        ),
      );
  }
}
