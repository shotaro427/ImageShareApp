import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/entities/room.entity.dart';

class TagList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _roomStore = watch(roomStore.state);
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
            return (index != _roomStore.tags.length)
                ? Container(
                    child: Center(
                      child: Text(
                        _roomStore.tags[index],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  )
                : GestureDetector(
                    child: Container(
                      child: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
          },
          itemCount: _roomStore.tags.length + 1,
        ),
      ),
    );
  }
}
