import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      autofocus: true,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'タイトルを入力',
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 19,
        ),
        border: InputBorder.none,
      ),
      cursorColor: Colors.black,
      onSubmitted: (title) {},
    );
  }
}
