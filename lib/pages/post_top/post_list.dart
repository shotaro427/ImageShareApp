import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/post_top/post_item.dart';

class PostList extends StatelessWidget {
  PostList(this._posts);

  final List<PostState> _posts;

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = _posts == null || _posts.length < 1;
    return isEmpty
        ? const Center(
            child: Text(
              '１件も投稿がありません。\n 右下のボタンから何か投稿してみましょう!!',
              textAlign: TextAlign.center,
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              mainAxisSpacing: 4.0,
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostItem(_posts[index]);
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
            ),
          );
  }
}
