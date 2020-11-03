import 'package:flutter/material.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/post_detail/bottom_nav_bar.dart';
import 'package:image_share_app/pages/post_detail/post_detail.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class PostDetailPage extends StatelessWidget {
  PostDetailPage(this._postState);

  final PostState _postState;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(_postState.title),
          ),
          body: PostDetail(),
          bottomNavigationBar: BottomNavBar(),
        ),
        // TODO add loading view
        LoadingView(false),
      ],
    );
  }
}
