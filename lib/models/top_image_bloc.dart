

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

/// トップ画面のBLoCクラス
class TopImagesBloc extends AbstractLoadingBloc {
  final DocumentSnapshot _roomInfo;
  bool isDispose = false;

  // 前件取得したかどうか
  bool _isFinished = false;


  TopImagesBloc(this._roomInfo) {
    _loadingController.sink.add(LoadingType.NOT_YET);
    fetchImageUrlString();
    scrollController.addListener(_pagingFetch);
  }

  final _valueController = StreamController<List<DocumentSnapshot>>();
  Stream<List<DocumentSnapshot>> get imagesValue => _valueController.stream;
  List<DocumentSnapshot> _images = [];

  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  final scrollController = ScrollController();

  void _pagingFetch() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      fetchImages();
    }
  }

  Future<void> fetchImageUrlString() async {
    _loadingController.sink.add(LoadingType.LOADING);
    await fetchImages();
    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  /// 画像の変更を監視する
  Future<void> listenImages() async {

    Query _imagesQuery = Firestore.instance
        .document(_roomInfo.reference.path)
        .collection("images")
        .orderBy("created_at")
        .limit(20);

    await _imagesQuery.getDocuments().then((data) {
      if (data.documents.length > 0) {
        _imagesQuery.snapshots().listen((data) {
          if (!isDispose) {
            _images.addAll(data.documentChanges
                .where((change) => change.type == DocumentChangeType.added || change.type == DocumentChangeType.modified)
                .where((change) => change.document.data['url'] != null)
                .map((change) => change.document));
            _valueController.sink.add(_images.reversed.toList());
          }
        });
      }
    }).catchError((e) => debugPrint(e.toString()));

  }

  /// 投稿を取得する
  Future<void> fetchImages() async {
    if (!_isFinished) {
      _loadingController.sink.add(LoadingType.LOADING);

      Query _imagesQuery;

      if (_images.length > 0) {
        _imagesQuery = Firestore.instance
            .document(_roomInfo.reference.path)
            .collection("images")
            .orderBy("created_at")
            .startAfterDocument(_images.last)
            .limit(20);
      } else {
        _imagesQuery = Firestore.instance
            .document(_roomInfo.reference.path)
            .collection("images")
            .orderBy("created_at")
            .limit(20);
      }

      await _imagesQuery.getDocuments().then((data) {
        if (data.documents.length > 0) {
          _images.addAll(data.documents);
          _valueController.sink.add(_images);
        } else {
          _isFinished = true;
        }
      }).catchError((e) => debugPrint(e.toString()));

      _loadingController.sink.add(LoadingType.COMPLETED);
    }
  }

  /// 一覧を初期化する
  Future<void> refreshImages() async {
    _isFinished = false;
    _images = [];
    await fetchImages();
  }

  void dispose() {
    _valueController.close();
    _loadingController.close();
    isDispose = true;
  }
}