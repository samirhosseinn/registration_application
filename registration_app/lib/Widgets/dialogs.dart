import 'package:flutter/material.dart';
import 'package:registration_app/style/style.dart';

Future<void> showErrorDiaog({
  required BuildContext context,
  required String text,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          text,
          style: AppTheme.blackText.button,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "ok",
              style: AppTheme.blackText.subtitle1,
            ),
          ),
        ],
      );
    },
  );
}
