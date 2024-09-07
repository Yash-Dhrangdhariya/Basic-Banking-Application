import 'package:flutter/material.dart';

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
    return Center(
      heightFactor: heightFactor,
      child: Text(
        errorMessage,
        style: textStyle,
      ),
    );
  }
}
