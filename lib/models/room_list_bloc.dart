
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';

/// ルーム一覧を取得するための BLoC
class RoomListBloc {
  final RoomListRepository _repository;
  final LoadingBloc _loadingBloc;

  /// ルーム一覧を取得したものを流すStreamControllerとStream
  final _roomListController = StreamController<List<DocumentSnapshot>>();
  Stream<List<DocumentSnapshot>> get roomListStream => _roomListController.stream;

  RoomListBloc(this._repository, this._loadingBloc);

  /// ユーザーが所属するルームの一覧を取得する
  void fetchRooms() async {
    _loadingBloc.loading(true);

    try {
      _roomListController.sink.add(await _repository.fetch());
    }catch(e) {
      debugPrint(e.toString());
    }

    _loadingBloc.loading(false);
  }

  void dispose() {
    _roomListController.close();
  }
}

/// ローディングクラス
class LoadingBloc {
  LoadingBloc() {
    loading(false);
  }

  final _valueController = StreamController<bool>();

  Stream<bool> get value => _valueController.stream;

  loading(bool isLoading) {
    _valueController.sink.add(isLoading);
  }

  void dispose() {
    _valueController.close();
  }
}