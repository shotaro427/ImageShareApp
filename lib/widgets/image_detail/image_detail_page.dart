
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {

  final DocumentSnapshot imageDocument;

  ImageDetailPage(this.imageDocument);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('詳細'),),
      body: _LayoutDetailImage(imageDocument),
    );
  }
}

class _LayoutDetailImage extends StatelessWidget {

  final DocumentSnapshot imageDocument;

  _LayoutDetailImage(this.imageDocument);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: 300,
        child: Image(
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width,
          image: NetworkImage(imageDocument.data['originalUrl']),
        ),
      ),
    );
  }
}