
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
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    imageDocument.data['title'].toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: Colors.grey[300]
                      )
                    )
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.note, color: Colors.grey,),
                              const Text('メモ', style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: Text(
                              imageDocument.data['memo'].toString()
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.local_offer, color: Colors.grey,),
                              const Text('タグ', style: TextStyle(color: Colors.grey),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}