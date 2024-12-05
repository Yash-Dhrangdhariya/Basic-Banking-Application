import 'package:basic_banking_app/utils/extensions.dart';
import 'package:flutter/cupertino.dart';

import '../constants/app_constants.dart';
import '../resource/app_colors.dart';
import '../values/app_strings.dart';

class BbaError extends StatelessWidget {
  const BbaError({
    this.errorMessage = AppStrings.oopsSomethingWentWrong,
    this.heightFactor = 10,
    this.textStyle,
    super.key,
  });

  final String errorMessage;
  final double heightFactor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: heightFactor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_circle,
            color: AppColors.text,
            size: 48,
          ),
          const SizedBox(height: AppConstants.appPadding),
          Text(
            errorMessage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: context.appText.subHeadline,
          ),
        ],
      ),
    );
  }
}
