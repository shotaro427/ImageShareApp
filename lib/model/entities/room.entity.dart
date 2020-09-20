import 'package:freezed_annotation/freezed_annotation.dart';
part 'room.entity.freezed.dart';
part 'room.entity.g.dart';

@freezed
abstract class RoomState with _$RoomState {
  const factory RoomState({
    int createdAt,
    int updateAt,
    @Default('') String id,
    @Default('') String name,
    @Default([]) List<String> tags,
    @Default([]) List<String> member,
    @Default([]) List<String> invited,
  }) = _RoomState;

  factory RoomState.fromJson(Map<String, dynamic> json) =>
      _$RoomStateFromJson(json);
}
