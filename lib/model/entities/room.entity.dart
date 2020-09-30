import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'room.entity.freezed.dart';
part 'room.entity.g.dart';

final roomStore = StateNotifierProvider((ref) => RoomController());

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

class RoomController extends StateNotifier<RoomState> {
  RoomController() : super(const RoomState());

  void updateRoom(RoomState room) {
    state = room;
  }
}
