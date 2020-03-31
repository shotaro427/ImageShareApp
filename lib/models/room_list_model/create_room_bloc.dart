
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/repositories/room_list_repository/create_room_repository.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_room_bloc.freezed.dart';

@freezed
abstract class CreateRoomState with _$CreateRoomState {
  const factory CreateRoomState() = _CreateRoomState;
  const factory CreateRoomState.loading() = Loading;
  const factory CreateRoomState.success({@required RoomInfoEntity roomInfoEntity}) = Success;
  const factory CreateRoomState.error({@Default('') String message}) = ErrorDetails;
}

/// グループ作成のstateを伝えるクラス
class CreateRoomStateNotifier extends StateNotifier<CreateRoomState> {

  final CreateRoomRepository _repository;

  CreateRoomStateNotifier(this._repository): super(const CreateRoomState());

  void createRoom(String roomName) async {
    state = const CreateRoomState.loading();

    try {
      final _roomInfo = await _repository.createRoom(roomName);
      state = CreateRoomState.success(roomInfoEntity: _roomInfo);
    } catch(e) {
      log(e.toString());
      state = CreateRoomState.error(message: e.toString());
    }
  }
}
