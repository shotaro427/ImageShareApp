

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

/// 部屋を追加を追われたときの処理
class AddRoomListBloc extends AbstractLoadingBloc {
  final RoomListRepository _repository;

  AddRoomListBloc(this._repository) {
    _loadingController.sink.add(LoadingType.NOT_YET);
  }

  /// 部屋を追加を追われたときに流れるStreamControllerとStream
  final _addRoomController = StreamController<void>();
  Stream<void> get addRoomStream => _addRoomController.stream;

  /// ローディングを開始したかどうか
  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  /// ルームを追加する
  pressed(String roomName) async {
    if (roomName.isEmpty || roomName == null) roomName = "名無し";
    _loadingController.sink.add(LoadingType.LOADING);

    /// ルーム追加
    try {
      _addRoomController.sink.add(await _repository.createRoom(roomName));
    } catch(e) {
      debugPrint(e.toString());
    }

    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  void dispose() {
    _addRoomController.close();
    _loadingController.close();
  }
}
