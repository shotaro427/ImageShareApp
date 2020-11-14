import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/image_view/image_view_page.dart';
import 'package:image_share_app/pages/post_detail/image_item.dart';

class PostImageList extends ConsumerWidget {
  PostImageList(this._postState);

  final PostState _postState;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(postDetailController.state);
    final mainImageIndex = state.imageIndex;
    final images = state.images;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          automaticallyImplyLeading: false,
          flexibleSpace: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ImageViewPage(
                  _postState.title,
                  state.images.elementAt(mainImageIndex).imageUrl,
                ),
              ),
            ),
            child: FlexibleSpaceBar(
              background: Image.network(
                images.elementAt(mainImageIndex).imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          expandedHeight: MediaQuery.of(context).size.width,
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) =>
                ImageItem(index, state.images.elementAt(index).imageUrl),
            childCount: state.images.length,
          ),
        ),
      ],
    );
  }
}
