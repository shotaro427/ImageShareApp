import 'package:flutter/material.dart';

Widget baseSnackBar(BuildContext context, String content) {
  return SnackBar(
    content: Text(content),
    action: SnackBarAction(
      label: '閉じる',
      onPressed: () => Scaffold.of(context).removeCurrentSnackBar(),
    ),
    duration: const Duration(seconds: 2),
  );
}
