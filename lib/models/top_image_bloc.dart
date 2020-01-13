

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

/// トップ画面のBLoCクラス
class TopImagesBloc extends AbstractLoadingBloc {
  final TopImagesRepository _repository;
  final DocumentSnapshot _roomInfo;

  TopImagesBloc(this._repository, this._roomInfo) {
    _loadingController.sink.add(LoadingType.NOT_YET);
    fetchImageUrlString();
  }

  final _valueController = StreamController<List<String>>();
  Stream<List<String>> get imagesValue => _valueController.stream;

  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  void fetchImageUrlString() async {
    _loadingController.sink.add(LoadingType.LOADING);
    _valueController.sink.add(await _repository.fetchImages(_roomInfo));
    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  void dispose() {
    _valueController.close();
    _loadingController.close();
  }
}

/// トップ画面の画像を取得するクラス
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