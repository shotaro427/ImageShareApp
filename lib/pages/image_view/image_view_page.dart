import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/pages/image_view/image_view.dart';

class ImageViewPage extends StatelessWidget {
  ImageViewPage(this._title, this._imageUrl);
  final String _title;
  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(_imageUrl),
      direction: DismissDirection.vertical,
      onDismissed: (direction) => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.black,
        ),
        body: ImageView(_imageUrl),
      ),
    );
  }
}
