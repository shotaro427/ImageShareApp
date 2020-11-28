import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/post_detail/bottom_nav_bar.dart';
import 'package:image_share_app/pages/post_detail/post_detail.dart';
import 'package:image_share_app/pages/post_detail/floating_buttons.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class PostDetailPage extends ConsumerWidget {
  PostDetailPage(this._postState);
  final PostState _postState;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoading = watch(postDetailController.state).isLoading;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(_postState.title),
          ),
          body: PostDetail(_postState),
          bottomNavigationBar: BottomNavBar(),
          floatingActionButton: FloatingButtons(),
        ),
        LoadingView(isLoading),
      ],
    );
  }
}
