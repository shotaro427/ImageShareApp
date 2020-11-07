import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/model/entities/post.entity.dart';

class PostImageList extends StatelessWidget {
  PostImageList(this._postState);

  final PostState _postState;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              _postState.thumbnailUrl,
              fit: BoxFit.cover,
            ),
          ),
          expandedHeight: MediaQuery.of(context).size.width,
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
