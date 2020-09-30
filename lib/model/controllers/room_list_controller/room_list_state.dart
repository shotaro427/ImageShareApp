import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
part 'room_list_state.freezed.dart';
part 'room_list_state.g.dart';

@freezed
abstract class RoomListState with _$RoomListState {
  const factory RoomListState({
    @Default(false) bool isLoading,
    List<RoomState> rooms,
    String error,
  }) = _RoomListState;

  factory RoomListState.fromJson(Map<String, dynamic> json) =>
      _$RoomListStateFromJson(json);
}
