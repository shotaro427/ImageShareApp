

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailViewPage extends StatelessWidget {

  String _imageUrlString;
  String _title = "名無し";

  ImageDetailViewPage(this._imageUrlString, String title) {
    if (title != null) {
      this._title = title;
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(_imageUrlString),
      direction: DismissDirection.vertical,
      onDismissed: (direction) => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
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