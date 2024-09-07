import 'package:flutter/material.dart';

class BbaVisibility extends StatelessWidget {
  const BbaVisibility({
    required this.child,
    this.visible = true,
    this.replacement = const SizedBox.shrink(),
    super.key,
  });

  final Widget replacement;
  final Widget child;
  final bool visible;

  @override
  Widget build(BuildContext context) => visible ? child : replacement;
}
