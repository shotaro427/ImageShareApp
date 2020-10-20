import 'package:flutter/material.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/pages/create_post_page/create_post.dart';
import 'package:image_share_app/pages/create_post_page/input_title.dart';

class CreatePostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: InputTitle(),
            ),
            body: CreatePost(),
            backgroundColor: backgroundColor,
          ),
          // TODO: add LoadingView
        ],
      ),
    );
  }
}
