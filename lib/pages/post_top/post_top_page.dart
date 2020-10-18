import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_top_controller/post_top_controller.dart';
import 'package:image_share_app/pages/post_top/floating_buttons.dart';
import 'package:image_share_app/pages/post_top/post_list.dart';
import 'package:image_share_app/pages/post_top/search_bar.dart';
import 'package:image_share_app/widget/atoms/loading_view.dart';

class PostTopPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final postTopState = watch(postTopController.state);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: SarchBar(),
            ),
            floatingActionButton: FloatingButtons(),
            body: PostList(postTopState.posts),
            backgroundColor: Colors.white,
          ),
          LoadingView(postTopState.isLoading),
        ],
      ),
    );
  }
}
