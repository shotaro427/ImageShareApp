
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {

  final DocumentSnapshot imageDocument;

  ImageDetailPage(this.imageDocument);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('詳細'),
      ),
      backgroundColor: Colors.black,
      body: _LayoutDetailImage(imageDocument),
    );
  }
}

class _LayoutDetailImage extends StatelessWidget {

  final DocumentSnapshot imageDocument;

  _LayoutDetailImage(this.imageDocument);

  @override
  Widget build(BuildContext context) {
    debugPrint(imageDocument.data['title'].toString());
    return Column(
      children: <Widget>[
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(3),   
          child: Image(
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
            image: NetworkImage(imageDocument.data['originalUrl']),
          ),
        ),
        const SizedBox(height: 3),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white
            ),
            child: Column(
              children: <Widget>[
                Text(
                  imageDocument.data['memo'].toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}