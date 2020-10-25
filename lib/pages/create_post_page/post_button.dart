import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_controller.dart';

class PostButton extends ConsumerWidget {
  PostButton(this._key);
  final GlobalKey<ScaffoldState> _key;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final createPostState = watch(createPostController.state);
    return GestureDetector(
      onTap: () => context.read(createPostController).createPost(_key),
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: const Center(
            child: Text(
              '投稿する',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: (createPostState.title.isNotEmpty &&
                      createPostState.pickedFiles != null &&
                      createPostState.pickedFiles.isNotEmpty)
                  ? Colors.blue
                  : Colors.grey[400]),
        ),
      ),
    );
  }
}
