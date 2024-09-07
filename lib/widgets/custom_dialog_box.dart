import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resource/app_text_styles.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    required this.title,
    required this.description,
    this.isSuccess = false,
    this.onPressed,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback? onPressed;
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSuccess)
              Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: Colors.greenAccent.shade700,
                size: 100,
              )
            else
              const Icon(
                CupertinoIcons.clear_thick_circled,
                color: Colors.red,
                size: 100,
              ),
            const SizedBox(height: 10),
            Text(
              title,
              style: AppTextStyles.dialogTitle.copyWith(
                color: isSuccess ? null : Colors.red,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyles.dialogDescription,
            ),
            const SizedBox(height: 18),
            Align(
              child: TextButton(
                onPressed: onPressed,
                child: const Text('Ok'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
