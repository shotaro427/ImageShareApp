import 'package:flutter/material.dart';

Widget baseSnackBar(BuildContext context, String content) {
  return SnackBar(
    content: Text(
      content,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    action: SnackBarAction(
      label: '閉じる',
      onPressed: () => Scaffold.of(context).removeCurrentSnackBar(),
      textColor: Colors.white,
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.blue,
    elevation: 6,
    behavior: SnackBarBehavior.floating,
  );
}
