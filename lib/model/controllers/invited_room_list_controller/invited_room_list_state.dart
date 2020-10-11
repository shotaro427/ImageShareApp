import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
part 'invited_room_list_state.freezed.dart';
part 'invited_room_list_state.g.dart';

@freezed
abstract class InvitedRoomState with _$InvitedRoomState {
  const factory InvitedRoomState({
    @Default(false) bool isLoading,
    List<RoomState> rooms,
    String error,
  }) = _InvitedRoomState;

  factory InvitedRoomState.fromJson(Map<String, dynamic> json) =>
      _$InvitedRoomStateFromJson(json);
}
