import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailViewPage extends StatelessWidget {
  final String _imageUrlString;
  final String _title;

  ImageDetailViewPage(this._imageUrlString, this._title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(_imageUrlString),
      direction: DismissDirection.vertical,
      onDismissed: (direction) => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          title: (_title != null) ? Text(_title) : const Text('無名'),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: PhotoView(
            imageProvider: NetworkImage(_imageUrlString),
            minScale: PhotoViewComputedScale.contained * 1.0,
            maxScale: 2.0,
          ),
        ),
      ),
    );
  }
}
