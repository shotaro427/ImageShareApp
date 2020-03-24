

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'top_image_bloc.freezed.dart';

@freezed
abstract class TopImageListState with _$TopImageListState {
  const factory TopImageListState() = _TopImageListState;
  const factory TopImageListState.loading() = Loading;
  const factory TopImageListState.success({@required List<ImageEntity> images}) = Success;
  const factory TopImageListState.error({@Default('') String message}) = ErrorDetails;
}

/// 投稿一覧のModelクラス
class TopImageListStateNotifier extends StateNotifier<TopImageListState> {
  final TopImageRepository _repository;

  TopImageListStateNotifier(this._repository): super(const TopImageListState());

  /// 取得した投稿情報
  List<ImageEntity> _images = [];

  /// 全件取得したかどうか
  bool _isFinished = false;

  /// 投稿一覧を取得する
  Future<void> fetchImages() async {
    state = const TopImageListState.loading();

    try {
      // まだ全件取得していなかったら、fetchする
      if (!_isFinished) {
        final QuerySnapshot _snapshot = await _repository.fetchImages(_images);
        if (_snapshot.documents.length > 0) {
          _images.addAll(_snapshot.documents.map((doc) => ImageEntity.fromJson(doc.data)));
          state = TopImageListState.success(images: _images);
        } else {
          _isFinished = true;
        }
      }
    } catch(e) {
      log(e.toString());
      state = TopImageListState.error(message: e.toString());
    }
  }

  /// 一覧を初期化してから再取得する
  void refresh() async {
    _images = [];
    _isFinished = false;
    await fetchImages();
  }
}

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

//      await _repository.fetchImages(_images).then((data) {
//        if (data.documents.length > 0) {
//          _images.addAll(data.documents);
//          _valueController.sink.add(_images);
//        } else {
//          _isFinished = true;
//        }
//      }).catchError((e) => debugPrint(e.toString()));

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

  final String _roomId;

  TopImageRepository(this._roomId);

  Future<QuerySnapshot> fetchImages(List<ImageEntity> images) {
    return _createImagesQuery(images).getDocuments();
  }

  /// ページング状況に合わせてクエリを変更
  Query _createImagesQuery(List<ImageEntity> images) {
    if (images.length > 0) {
      return Firestore.instance
          .collection('rooms')
          .document(_roomId)
          .collection("images")
          .orderBy("created_at")
          .startAfter([images.last.created_at])
          .limit(20);
    } else {
      return Firestore.instance
          .collection('rooms')
          .document(_roomId)
          .collection("images")
          .orderBy("created_at")
          .limit(20);
    }
  }
}