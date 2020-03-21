
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

  WaitingRoomListStateNotifier(this._repository): super(const WaitingRoomListState());

  void fetchWaitingRooms() async {
    state = const WaitingRoomListState.loading();

    try {
      final _rooms = await _repository.fetchWaitingRooms();
      state = WaitingRoomListState.success(rooms: _rooms);
    } catch(e) {
      log(e.toString());
      state = WaitingRoomListState.error(message: e.toString());
    }
  }

  void joinRoom(String roomId) async {
    state = const WaitingRoomListState.loading();

    try {
      await _repository.joinRoom(roomId);
      return;
    } catch(e) {
      log(e.toString());
      state = WaitingRoomListState.error(message: e.toString());
      return;
    }
  }
}
