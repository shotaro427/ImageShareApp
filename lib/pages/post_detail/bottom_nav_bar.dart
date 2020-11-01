import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_controller.dart';

class BottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _postDetailController = watch(postDetailController);
    final _postDetailState = watch(postDetailController.state);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          title: Text('写真'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.picture_as_pdf),
          title: Text('PDF'),
        ),
      ],
      selectedItemColor: Colors.blue,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      currentIndex: _postDetailState.currentIndex,
      onTap: (int index) => _postDetailController.switchIndex(index),
    );
  }
}
