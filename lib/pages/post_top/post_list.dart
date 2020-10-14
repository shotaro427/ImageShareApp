import 'package:flutter/material.dart';
import 'package:image_share_app/pages/post_top/post_item.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return PostItem();
        },
        itemCount: 10,
      ),
    );
  }
}
