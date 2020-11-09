import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  ImageView(this._imageUrl);
  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        imageProvider: NetworkImage(_imageUrl),
        minScale: PhotoViewComputedScale.contained * 1.0,
        maxScale: 2.0,
      ),
    );
  }
}
