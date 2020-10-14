import 'package:flutter/material.dart';
import 'package:image_share_app/pages/post_top/post_list.dart';
import 'package:image_share_app/pages/post_top/search_bar.dart';

class PostTopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: SarchBar(),
        ),
        body: PostList(),
      ),
    );
  }
}
