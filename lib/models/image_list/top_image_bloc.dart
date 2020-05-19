import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:image_share_app/repositories/image_list_repositories/top_image_repository.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'top_image_bloc.freezed.dart';

@freezed
abstract class TopImageListState with _$TopImageListState {
  const factory TopImageListState() = _TopImageListState;
  const factory TopImageListState.loading() = Loading;
  const factory TopImageListState.success(
      {@required List<ImageEntity> images}) = Success;
  const factory TopImageListState.error({@Default('') String message}) =
      ErrorDetails;
}

/// 投稿一覧のModelクラス
class TopImageListStateNotifier extends StateNotifier<TopImageListState> {
  final TopImageRepository _repository;

  TopImageListStateNotifier(this._repository)
      : super(const TopImageListState()) {
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

        // 投稿を整列
        if (_snapshot.documents.length > 0) {
          final List<ImageEntity> _newImages = _snapshot.documents
              .map((doc) => ImageEntity.fromJson(doc.data))
              .toList();
          _newImages.removeWhere(
              (item) => item.url == null || item.originalUrl == null);
          _images.addAll(_newImages);
          state = TopImageListState.success(images: _images);
        } else {
          _isFinished = true;
          state = const TopImageListState.success(images: []);
        }
      }
    } catch (e) {
      log(e.toString());
      state = TopImageListState.error(message: e.toString());
    }
  }

  /// 投稿一覧を検索条件から取得する
  Future<void> searchImages({@Default('') String keyWord}) async {
    // 初期化
    _images = [];
    // ローディング
    state = const TopImageListState.loading();

    try {
      final QuerySnapshot _snapshot =
          await _repository.fetchImages(_images, keyWord: keyWord);

      // 投稿を整列
      if (_snapshot.documents.length > 0) {
        final List<ImageEntity> _newImages = _snapshot.documents
            .map((doc) => ImageEntity.fromJson(doc.data))
            .toList();
        _newImages.removeWhere(
            (item) => item.url == null || item.originalUrl == null);
        _images.addAll(_newImages);
        state = TopImageListState.success(images: _images);
      } else {
        // TODO: ここにメモを検索するクエリを書く
        log('search result is empty');
        state = const TopImageListState.success(images: []);
      }
    } catch (e) {
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

// AppBarの状態管理

/// AppBarの状態
class SearchBarState {
  SearchBarState(this.isSearchMode);

  /// 検索状態かどうか
  /// text_fieldが出ている時はtrue
  final bool isSearchMode;
}

/// AppBarの状態通知
class SearchBarStateNotifier extends StateNotifier<SearchBarState> {
  SearchBarStateNotifier() : super(SearchBarState(false));

  void switchSearchingMode() {
    state = SearchBarState(!state.isSearchMode);
  }
}
