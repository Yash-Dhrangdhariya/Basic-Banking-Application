import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description;
  final Function onPressed;
  final bool isSuccess;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.onPressed,
    this.isSuccess = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
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
          isSuccess
              ? Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Colors.greenAccent[700],
                  size: 100,
                )
              : Icon(
                  CupertinoIcons.clear_thick_circled,
                  color: Colors.red,
                  size: 100,
                ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: isSuccess ? Colors.black : Colors.red,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: onPressed,
              child: Text("Ok"),
            ),
          ),
        ],
      ),
    );
  }
}
