import 'package:basic_banking_app/resource/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resource/app_colors.dart';

class SnackBarService {
  const SnackBarService._();

  static final _key = GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get key => _key;

  static void showSnack(String message, {String? subMessage, String? icon}) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.darkAppText.sbSubHeadline,
                    ),
                    if (subMessage?.isNotEmpty ?? false) ...[
                      const SizedBox(height: 2),
                      Text(
                        subMessage!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.darkAppText.subHeadline,
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
