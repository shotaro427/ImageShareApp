
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
part 'waiting_room_list_model.freezed.dart';

@freezed
abstract class WaitingRoomListState with _$WaitingRoomListState {
  const factory WaitingRoomListState() = _WaitingRoomListState;
  const factory WaitingRoomListState.loading() = Loading;
  const factory WaitingRoomListState.success({@required List<RoomInfoEntity> rooms}) = Success;
  const factory WaitingRoomListState.error({@Default('') String message}) = ErrorDetails;
}