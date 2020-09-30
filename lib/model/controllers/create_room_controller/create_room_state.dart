import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_room_state.freezed.dart';

@freezed
abstract class CreateRoomState with _$CreateRoomState {
  const factory CreateRoomState({
    @Default(false) bool isLoading,
    String error,
  }) = _CreateRoomState;
}
