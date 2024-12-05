import 'dart:async';

import 'package:basic_banking_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../resource/app_colors.dart';
import '../../values/app_strings.dart';
import 'bba_button_store.dart';

class BbaButton extends StatefulWidget {
  const BbaButton({
    this.onTap,
    this.enabled = true,
    this.title,
    this.width = double.maxFinite,
    this.height,
    this.forceLoading = false,
    this.padding,
    this.icon,
    this.child,
    this.minimumButtonWidth = false,
    this.shape,
    this.side,
    this.backgroundColor,
    this.loadingWidget,
    this.textStyle,
    this.textColor,
    super.key,
  });

  final ValueGetter<FutureOr<void>>? onTap;
  final bool enabled;
  final String? title;
  final double? width;
  final double? height;
  final bool forceLoading;
  final Widget? child;
  final EdgeInsets? padding;
  final Widget? icon;
  final bool minimumButtonWidth;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final Color? backgroundColor;
  final Widget? loadingWidget;
  final TextStyle? textStyle;
  final Color? textColor;

  @override
  State<BbaButton> createState() => _BbaButtonState();
}

class _BbaButtonState extends State<BbaButton> {
  final store = BbaButtonStore();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final isLoading = widget.forceLoading || store.isLoading;
        return SizedBox(
          width: widget.minimumButtonWidth ? null : widget.width,
          height: widget.height ?? 48,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: widget.shape ??
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
              side: widget.side ?? BorderSide.none,
              padding: widget.padding,
              enableFeedback: !isLoading,
              backgroundColor: widget.backgroundColor,
              disabledBackgroundColor: widget.backgroundColor?.withOpacity(0.5),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: widget.enabled
                ? () => store.onTap(callback: widget.onTap, loading: isLoading)
                : null,
            child: isLoading
                ? widget.loadingWidget ??
                    const SpinKitRotatingCircle(
                      size: 18,
                      color: AppColors.white,
                    )
                : widget.child ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: widget.minimumButtonWidth
                          ? MainAxisSize.min
                          : MainAxisSize.max,
                      children: [
                        if (widget.icon != null) ...[
                          widget.icon!,
                          if (widget.title != null) const SizedBox(width: 8),
                        ],
                        Flexible(
                          child: widget.title != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: FittedBox(
                                        child: Text(
                                          widget.title ?? AppStrings.kEmpty,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: widget.textStyle == null
                                              ? context.appText.headline
                                                  .copyWith(
                                                  color: widget.textColor ??
                                                      AppColors.background,
                                                )
                                              : widget.textStyle?.copyWith(
                                                  color: widget.enabled
                                                      ? null
                                                      : widget.textStyle?.color
                                                          ?.withOpacity(0.8),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
          ),
        );
      },
    );
  }
}
