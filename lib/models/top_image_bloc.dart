

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

/// トップ画面のBLoCクラス
class TopImagesBloc extends AbstractLoadingBloc {
  final DocumentSnapshot _roomInfo;

  TopImagesBloc(this._roomInfo) {
    _loadingController.sink.add(LoadingType.NOT_YET);
    fetchImageUrlString();
  }

  final _valueController = StreamController<List<String>>();
  Stream<List<String>> get imagesValue => _valueController.stream;
  List<String> _images = [];

  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  void fetchImageUrlString() async {
    _loadingController.sink.add(LoadingType.LOADING);
    await fetchImages();
    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  /// 画像を取得してくる
  Future<void> fetchImages() async {

    Query _imagesQuery = Firestore.instance
        .document(_roomInfo.reference.path)
        .collection("images")
        .orderBy("created_at")
        .limit(10);

    await _imagesQuery.getDocuments().then((data) {
      if (data.documents.length > 0) {
        _imagesQuery.snapshots().listen((data) {
          _images.addAll(data.documentChanges
              .where((change) => change.type != DocumentChangeType.removed)
              .map((change) => change.document.data["url"].toString()));
          _valueController.sink.add(_images.reversed.toList());
        });
      }
    }).catchError((e) => debugPrint(e.toString()));

  }

  void dispose() {
    _valueController.close();
    _loadingController.close();
  }
}