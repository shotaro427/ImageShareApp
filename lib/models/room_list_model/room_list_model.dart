import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/repositories/room_list_repository/joined_room_list_repository.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'room_list_model.freezed.dart';

@freezed
abstract class JoinedRoomListState with _$JoinedRoomListState {
  const factory JoinedRoomListState() = _JoinedRoomListState;
  const factory JoinedRoomListState.loading() = Loading;
  const factory JoinedRoomListState.success(
      {@required List<RoomInfoEntity> rooms}) = Success;
  const factory JoinedRoomListState.error({@Default('') String message}) =
      ErrorDetails;
}

class JoinedRoomListStateNotifier extends StateNotifier<JoinedRoomListState> {
  final RoomListRepository _repository;
  final List<RoomInfoEntity> _rooms = [];

  bool isFinished = false;

  JoinedRoomListStateNotifier(this._repository)
      : super(const JoinedRoomListState());

  Future<void> fetchJoinedRooms() async {
    state = const JoinedRoomListState.loading();

    try {
      // 全て取得したかの確認
      if (isFinished) {
        state = JoinedRoomListState.success(rooms: _rooms);
        return;
      }

      List<RoomInfoEntity> _addRooms = [];
      // 空だったら一番最初から取得する
      if (_rooms.isEmpty) {
        _addRooms.addAll((await _repository.fetchJoinedRooms()));
      } else {
        _addRooms.addAll((await _repository.fetchJoinedRooms(lastRoom: _rooms.last)));
      }

      if (_addRooms.isEmpty) {
        isFinished = true;
      }

      _rooms.addAll(_addRooms);

      state = JoinedRoomListState.success(rooms: _rooms);
    } catch (e) {
      log(e.toString());
      state = JoinedRoomListState.error(message: e.toString());
    }
  }

  Future<void> refresh() async {
    // 初期化
    isFinished = false;
    _rooms.clear();
    state = const JoinedRoomListState.loading();

    try {
      final _clearRooms = await _repository.fetchJoinedRooms();
      state = JoinedRoomListState.success(rooms: _clearRooms);
    } catch (e) {
      log(e.toString());
      state = JoinedRoomListState.error(message: e.toString());
    }
  }
}
