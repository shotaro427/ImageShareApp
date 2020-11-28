import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/post_detail/bottom_nav_bar.dart';
import 'package:image_share_app/pages/post_detail/post_detail.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class PostDetailPage extends ConsumerWidget {
  PostDetailPage(this._postState);
  final PostState _postState;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(postDetailController.state);
    final isLoading = state.isLoading;
    final currentIndex = state.currentIndex;

    void onPressed() {
      if (currentIndex == 0) {
        context.read(postDetailController).pickUpImage();
      } else if (currentIndex == 1) {
        context.read(postDetailController).pickUpPdf();
      }
    }

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(_postState.title),
          ),
          body: PostDetail(_postState),
          bottomNavigationBar: BottomNavBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: onPressed,
            child: const Icon(
              Icons.add,
              size: 33,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        LoadingView(isLoading),
      ],
    );
  }
}
