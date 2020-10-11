import 'package:flutter/material.dart';

class SarchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: 'キーワードを入力',
        hintStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide.none,
        ),
      ),
      cursorColor: Colors.black,
      onSubmitted: (searchText) {},
    );
  }
}
