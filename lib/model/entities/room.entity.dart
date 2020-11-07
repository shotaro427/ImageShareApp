import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';
part 'room.entity.freezed.dart';
part 'room.entity.g.dart';

final roomStore =
    StateNotifierProvider((ref) => RoomController(FirestoreService()));

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
    @Default('') String iconUrl,
  }) = _RoomState;

  factory RoomState.fromJson(Map<String, dynamic> json) =>
      _$RoomStateFromJson(json);
}

class RoomController extends StateNotifier<RoomState> {
  RoomController(this._firestoreService) : super(const RoomState());

  FirestoreService _firestoreService;

  Future<void> updateRoom(RoomState room) async {
    await _firestoreService.saveRoomInfo(room);
    state = room;
  }

  void updateState(RoomState room) {
    state = room;
  }

  void addInputTag() {
    final List<String> _newTags = state.tags;
    if (!_newTags.contains(':/input')) {
      _newTags.add(':/input');
    }
    state = state.copyWith(tags: _newTags);
  }
}
