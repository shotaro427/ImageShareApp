
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/repositories/room_list_repository/waiting_room_list_repository.dart';
import 'package:state_notifier/state_notifier.dart';
part 'waiting_room_list_model.freezed.dart';

@freezed
abstract class WaitingRoomListState with _$WaitingRoomListState {
  const factory WaitingRoomListState() = _WaitingRoomListState;
  const factory WaitingRoomListState.loading() = Loading;
  const factory WaitingRoomListState.success({@required List<RoomInfoEntity> rooms}) = Success;
  const factory WaitingRoomListState.error({@Default('') String message}) = ErrorDetails;
}

class WaitingRoomListStateNotifier extends StateNotifier<WaitingRoomListState> {

  final WaitingRoomListRepository _repository;

  bool isFinished = false;

  WaitingRoomListStateNotifier(this._repository): super(const WaitingRoomListState());

  // グループの配列　
  List<RoomInfoEntity> _rooms = [];

  Future<void> fetchWaitingRooms() async {
    state = const WaitingRoomListState.loading();

    try {
      // 全て取得したかの確認
      if (isFinished) {
        state = WaitingRoomListState.success(rooms: _rooms);
        return;
      }

      List<RoomInfoEntity> _addRooms = [];
      // 空だったら一番最初から取得する
      if (_rooms.isEmpty) {
        _addRooms.addAll((await _repository.fetchWaitingRooms()));
      } else {
        _addRooms.addAll((await _repository.fetchWaitingRooms(lastRoom: _rooms.last)));
      }

      if (_addRooms.isEmpty) {
        isFinished = true;
      }

      _rooms.addAll(_addRooms);

      state = WaitingRoomListState.success(rooms: _rooms);
    } catch(e) {
      log(e.toString());
      state = WaitingRoomListState.error(message: e.toString());
    }
  }

  void joinRoom(String roomId) async {
    state = const WaitingRoomListState.loading();

    try {
      _rooms = _rooms.where((ele) => ele.roomId != roomId).toList();
      await _repository.joinRoom(roomId);
      state = WaitingRoomListState.success(rooms: _rooms);
    } catch(e) {
      log(e.toString());
      state = WaitingRoomListState.error(message: e.toString());
      return;
    }
  }

  Future<void> refresh() async {
    // 初期化
    isFinished = false;
    _rooms.clear();
    state = const WaitingRoomListState.loading();

    try {
      final _clearRooms = await _repository.fetchWaitingRooms();
      state = WaitingRoomListState.success(rooms: _clearRooms);
    } catch(e) {
      log(e.toString());
      state = WaitingRoomListState.error(message: e.toString());
    }
  }
}
