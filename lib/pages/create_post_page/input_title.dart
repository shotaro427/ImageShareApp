import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_controller.dart';

class InputTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
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
      onChanged: (title) => context.read(createPostController).setTitle(title),
    );
  }
}
