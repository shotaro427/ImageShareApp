

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_share_app/repositories/room_list_repository/joined_room_list_repository.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_room_bloc.freezed.dart';

@freezed
abstract class CreateRoomState with _$CreateRoomState {
  const factory CreateRoomState() = _CreateRoomState;
  const factory CreateRoomState.loading() = Loading;
  const factory CreateRoomState.success() = Success;
  const factory CreateRoomState.error({@Default('') String message}) = ErrorDetails;
}

/// グループ作成のstateを伝えるクラス
class CreateRoomStateNotifier extends StateNotifier<CreateRoomState> {

  final RoomListRepository _repository;

  CreateRoomStateNotifier(this._repository): super(const CreateRoomState());

  void createRoom(String roomName) async {
    state = const CreateRoomState.loading();

    try {
      await _repository.createRoom(roomName);
      state = const CreateRoomState.success();
    } catch(e) {
      state = CreateRoomState.error(message: e.toString());
    }
  }
}

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
