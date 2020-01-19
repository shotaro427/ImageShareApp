
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {

  final String thumbnailUrl;

  ImageDetailPage(this.thumbnailUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('詳細'),),
      body: _LayoutDetailImage(thumbnailUrl),
    );
  }
}

class _LayoutDetailImage extends StatelessWidget {

  final String thumbnailUrl;

  _LayoutDetailImage(this.thumbnailUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(3),
      child: Image(
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width,
        image: NetworkImage(thumbnailUrl),
      ),
    );
  }
}