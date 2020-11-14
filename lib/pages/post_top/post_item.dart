import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/pages/post_detail/post_detail_page.dart';
import 'package:image_share_app/pages/post_top/tag_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostItem extends StatelessWidget {
  PostItem(this._postState);
  final PostState _postState;

  void onTap(BuildContext context) {
    context.read(postStore).updatePost(_postState);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PostDetailPage(_postState),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final IMAGE_WIDTH = (MediaQuery.of(context).size.width - 40);

    return GestureDetector(
      onTap: () => onTap(context),
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: IMAGE_WIDTH,
                height: (IMAGE_WIDTH * 0.7),
                child: (_postState.thumbnailUrl != null &&
                        _postState.thumbnailUrl.isNotEmpty)
                    ? Image.network(
                        _postState.thumbnailUrl,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'images/icon.jpeg',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                _postState.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TagList(_postState.tags),
            const SizedBox(height: 16),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    bottom: 15,
                  ),
                  child: Text(
                    fromAtNow(_postState.createdAt) ?? '',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String fromAtNow(int millseconds) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(millseconds);
  final Duration difference = DateTime.now().difference(date);
  final int sec = difference.inSeconds;

  if (sec >= 60 * 60 * 24) {
    return '${difference.inDays.toString()}日前';
  } else if (sec >= 60 * 60) {
    return '${difference.inHours.toString()}時間前';
  } else if (sec >= 60) {
    return '${difference.inMinutes.toString()}分前';
  } else {
    return '$sec秒前';
  }
}
