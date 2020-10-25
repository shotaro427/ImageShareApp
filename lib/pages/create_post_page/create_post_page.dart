import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/color.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_controller.dart';
import 'package:image_share_app/pages/create_post_page/create_post.dart';
import 'package:image_share_app/pages/create_post_page/input_title.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class CreatePostPage extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(createPostController.state).isLoading;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: InputTitle(),
            ),
            body: CreatePost(_scaffoldKey),
            backgroundColor: backgroundColor,
            key: _scaffoldKey,
          ),
          LoadingView(isLoading),
        ],
      ),
    );
  }
}
