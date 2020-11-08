import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/post_detail/image_item.dart';

class PostImageList extends ConsumerWidget {
  PostImageList(this._postState);

  final PostState _postState;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final mainImageIndex = watch(postDetailController.state).imageIndex;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (mainImageIndex % 9)],
              child: Text('grid item $mainImageIndex'),
            ),
            // background: Image.network(
            //   _postState.thumbnailUrl,
            //   fit: BoxFit.cover,
            // ),
          ),
          expandedHeight: MediaQuery.of(context).size.width,
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => ImageItem(index),
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
