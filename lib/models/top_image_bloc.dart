

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

/// トップ画面のBLoCクラス
class TopImagesBloc extends AbstractLoadingBloc {
  final TopImageRepository _repository;

  TopImagesBloc(this._repository) {
    _loadingController.sink.add(LoadingType.NOT_YET);
    fetchImages();
    scrollController.addListener(_pagingFetch);
  }

  bool isDispose = false;

  // 前件取得したかどうか
  bool _isFinished = false;

  final _valueController = StreamController<List<DocumentSnapshot>>();
  Stream<List<DocumentSnapshot>> get imagesValue => _valueController.stream;
  List<DocumentSnapshot> _images = [];

  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  final scrollController = ScrollController();

  // MARK: Functions

  /// ページング処理
  void _pagingFetch() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      fetchImages();
    }
  }

  /// 投稿を取得する
  Future<void> fetchImages() async {
    if (!_isFinished) {
      _loadingController.sink.add(LoadingType.LOADING);

      await _repository.fetchImages(_images).then((data) {
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

class TopImageRepository {

  final DocumentSnapshot _roomInfo;

  TopImageRepository(this._roomInfo);

  Future<QuerySnapshot> fetchImages(List<DocumentSnapshot> images) {
    return _createImagesQuery(images).getDocuments();
  }

  /// ページング状況に合わせてクエリを変更
  Query _createImagesQuery(List<DocumentSnapshot> images) {
    if (images.length > 0) {
      return Firestore.instance
          .document(_roomInfo.reference.path)
          .collection("images")
          .orderBy("created_at")
          .startAfterDocument(images.last)
          .limit(20);
    } else {
      return Firestore.instance
          .document(_roomInfo.reference.path)
          .collection("images")
          .orderBy("created_at")
          .limit(20);
    }
  }
}