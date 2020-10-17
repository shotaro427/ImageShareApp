import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_share_app/pages/post_top/post_item.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      // child: GridView.builder(
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 8,
      //     crossAxisSpacing: 5,
      //     childAspectRatio: 0.7,
      //   ),
      //   itemBuilder: (BuildContext context, int index) {
      //     return PostItem();
      //   },
      //   itemCount: 10,
      // ),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        itemCount: 10,
        itemBuilder: (context, index) {
          return PostItem();
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      ),
    );
  }
}
