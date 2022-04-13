import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextFieldContainer extends StatefulWidget {
  final Widget child;

  const CustomTextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  _CustomTextFieldContainerState createState() =>
      _CustomTextFieldContainerState();
}

class _CustomTextFieldContainerState extends State<CustomTextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: new Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          decoration: BoxDecoration(
            // color: Colors.grey[200],
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey.shade200.withOpacity(0.5),
          ),
          child: new Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
