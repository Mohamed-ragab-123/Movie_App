import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoding({required BuildContext context, required String message, String? posActionName, String? title}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? "Loading"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(message),
            ],
          ),
          actions: posActionName != null
              ? [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(posActionName),
            ),
          ]
              : null,
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
