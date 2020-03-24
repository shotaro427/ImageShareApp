

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
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

  TopImageListStateNotifier(this._repository): super(const TopImageListState()) {
    fetchImages();
  }

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
          state = const TopImageListState.success(images: []);
        }
      }
    } catch(e) {
      log(e.toString());
      state = TopImageListState.error(message: e.toString());
    }
  }

  /// 一覧を初期化してから再取得する
  Future<void> refresh() async {
    _images = [];
    _isFinished = false;
    await fetchImages();
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
          .orderBy("created_at", descending: true)
          .startAfter([images.last.created_at])
          .limit(20);
    } else {
      return Firestore.instance
          .collection('rooms')
          .document(_roomId)
          .collection("images")
          .orderBy("created_at", descending: true)
          .limit(20);
    }
  }
}
