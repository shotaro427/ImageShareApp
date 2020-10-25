import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_post_controller/create_post_controller.dart';
import 'package:image_share_app/model/entities/room.entity.dart';

class TagList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _roomStore = watch(roomStore.state);
    final _createPostState = watch(createPostController.state);
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index != _roomStore.tags.length &&
                _roomStore.tags[index] == ':/input') {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                    decoration: const InputDecoration(
                        hintText: '新しいタグを入力',
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                        border: InputBorder.none),
                    cursorColor: Colors.black,
                    onSubmitted: (value) =>
                        context.read(createPostController).addNewTag(value),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
              );
            } else if (index != _roomStore.tags.length) {
              final _tag = _roomStore.tags[index];
              return GestureDetector(
                onTap: () => context.read(createPostController).toggleTag(_tag),
                child: Container(
                  child: Center(
                    child: Text(
                      _tag,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: (_createPostState.tags.contains(_tag))
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: (_createPostState.tags.contains(_tag))
                        ? Colors.white
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              );
            } else {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    if (!_roomStore.tags.contains(':/input')) {
                      context.read(createPostController).switchInputTagMode();
                      context.read(roomStore).addInputTag();
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                ),
                decoration: BoxDecoration(
                  color: (_roomStore.tags.contains(':/input'))
                      ? Colors.grey[300]
                      : Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
              );
            }
          },
          itemCount: _roomStore.tags.length + 1,
        ),
      ),
    );
  }
}
