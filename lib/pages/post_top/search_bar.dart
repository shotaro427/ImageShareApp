import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_top_controller/post_top_controller.dart';

class SarchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        fillColor: Colors.white,
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
      onSubmitted: (searchText) =>
          context.read(postTopController).getPosts(query: searchText),
    );
  }
}
