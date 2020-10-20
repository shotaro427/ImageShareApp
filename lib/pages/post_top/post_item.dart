import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/post_top/tag_list.dart';

class PostItem extends StatelessWidget {
  PostItem(this._postState);
  final PostState _postState;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: (MediaQuery.of(context).size.width - 40),
              child: (_postState.thumbnailUrl != null &&
                      _postState.thumbnailUrl.isNotEmpty)
                  ? Image.network(_postState.thumbnailUrl)
                  : Image.asset(
                      'images/icon.jpeg',
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              _postState.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TagList(_postState.tags),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  bottom: 15,
                ),
                child: Text(
                  _postState.createdAt.toString() ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
