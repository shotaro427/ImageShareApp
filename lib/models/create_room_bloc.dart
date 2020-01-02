

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';

/// 部屋を追加を追われたときの処理
class AddRoomListBloc {
  final RoomListRepository _repository;
  final LoadingBloc _loadingBloc;

  AddRoomListBloc(this._repository, this._loadingBloc);

  /// 部屋を追加を追われたときに流れるStreamControllerとStream
  final _addRoomController = StreamController<void>();
  Stream<void> get addRoomStream => _addRoomController.stream;

  pressed(String roomName) async {
    if (roomName.isEmpty || roomName == null) roomName = "名無し";
    _loadingBloc.loading(true);
    try {
      _addRoomController.sink.add(await _repository.createRoom(roomName));
    } catch(e) {
      debugPrint(e.toString());
    }
    _loadingBloc.loading(false);
  }

  void dispose() {
    _addRoomController.close();
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