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

  JoinedRoomListStateNotifier(this._repository)
      : super(const JoinedRoomListState());

  Future<void> fetchJoinedRooms() async {
    state = const JoinedRoomListState.loading();

    try {
      final _rooms = await _repository.fetchJoinedRooms();
      state = JoinedRoomListState.success(rooms: _rooms);
    } catch (e) {
      log(e.toString());
      state = JoinedRoomListState.error(message: e.toString());
    }
  }
}
