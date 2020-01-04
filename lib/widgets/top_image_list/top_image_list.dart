
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

class TopImagesPage extends StatelessWidget {

  final DocumentSnapshot roomInfo;

  TopImagesPage(this.roomInfo);

  final List<IconData> icons = [
    Icons.access_alarm,
    Icons.arrow_back_ios,
    Icons.account_balance_wallet,
    Icons.center_focus_weak,
    Icons.blur_on,
    Icons.dashboard,
    Icons.phone,
    Icons.tap_and_play,
  ];

  @override
  Widget build(BuildContext context) {
    return Provider<TopImagesBloc>(
      create: (_) => TopImagesBloc(TopImagesRepository(), roomInfo),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(title: Text(roomInfo["name"].toString()),),
        body: ImagesWidget()
      ),
    );
  }
}

class ImagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<TopImagesBloc>(context, listen: false);
    return StreamBuilder<List<String>>(
      stream: bloc.value,
      initialData: [],
      builder: (context, snapshot) {
        return GridView.builder(
          itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
              ),
              child: Image.network(snapshot.data[index]),
            );
          },
        );
      },
    );
  }
}

class TopImagesBloc {
  final TopImagesRepository _repository;
  final DocumentSnapshot _roomInfo;

  TopImagesBloc(this._repository, this._roomInfo) {
    fetchImageUrlString();
  }

  final _valueController = StreamController<List<String>>();
  Stream<List<String>> get value => _valueController.stream;

  void fetchImageUrlString() async {

    _valueController.sink.add(await _repository.fetchImages(_roomInfo));
  }

  void dispose() {
    _valueController.close();
  }
}

class TopImagesRepository {

  Future<List<String>> fetchImages(DocumentSnapshot roomInfo) async {

    List<String> imagesUrlString = [];

    await Firestore.instance
        .document(roomInfo.reference.path)
        .collection("images")
        .getDocuments()
        .then((data) {
          imagesUrlString.addAll(data.documents.map((doc) => doc.data["url"].toString()));
        }).catchError((e) => debugPrint(e.toString()));

    debugPrint(imagesUrlString.toString());

    return imagesUrlString;
  }
}