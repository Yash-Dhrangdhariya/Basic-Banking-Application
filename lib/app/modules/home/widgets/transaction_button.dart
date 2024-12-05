import 'package:basic_banking_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionButton extends StatelessWidget {
  const TransactionButton({
    required this.icon,
    required this.title,
    this.onTap,
    super.key,
  });

  final String title;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: onTap,
          elevation: 0,
          highlightColor: Colors.transparent,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset(
            icon,
            width: 60,
            height: 60,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.appText.subHeadline,
        ),
      ],
    );
  }
}
