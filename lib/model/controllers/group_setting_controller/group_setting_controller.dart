import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/group_setting_controller/group_setting_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final groupSettingController = StateNotifierProvider((ref) {
  final _room = ref.watch(roomStore.state);
  final _roomStore = ref.watch(roomStore);
  return GroupSettingController(
    _room,
    _roomStore,
    FirestoreService(),
    FilePickerService(),
  );
});

class GroupSettingController extends StateNotifier<GroupSettingState> {
  GroupSettingController(
    this._room,
    this._roomStore,
    this._firestoreService,
    this._filePickerService,
  ) : super(const GroupSettingState()) {
    getMember();
  }

  final RoomState _room;
  final RoomController _roomStore;
  final FirestoreService _firestoreService;
  final FilePickerService _filePickerService;

  Future<void> getMember() async {
    state = state.copyWith(isLoading: true);
    try {
      final member = await _firestoreService.getMember(_room.member);
      final invited = await _firestoreService.getMember(_room.invited);
      state = state.copyWith(
        isLoading: false,
        error: null,
        member: member,
        invited: invited,
      );
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> changeGroupHeaderImage() async {
    state = state.copyWith(isLoading: true);
    try {
      final iconFile = await _filePickerService.getSingleImageFile();
      final newRoom = await _firestoreService.setGroupIcon(iconFile, _room);
      await _roomStore.updateRoom(newRoom);

      state = state.copyWith(isLoading: false, error: null);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> removeMember(String targetUid, String roomId) async {
    state = state.copyWith(isLoading: true);
    try {
      // remove
      RoomState newRoom = _room;
      final List<String> newMembers = List.from(newRoom.member);
      newMembers.removeWhere((m) => m == targetUid);
      newRoom = newRoom.copyWith(member: newMembers);

      await Future.wait([
        _firestoreService.deleteUserFromGroup(targetUid, roomId),
        _roomStore.updateRoom(newRoom),
      ]);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> removeInvited(String targetUid, String roomId) async {
    state = state.copyWith(isLoading: true);
    try {
      // remove
      RoomState newRoom = _room;
      final List<String> newInvited = List.from(newRoom.invited);
      newInvited.removeWhere((m) => m == targetUid);
      newRoom = newRoom.copyWith(invited: newInvited);

      await Future.wait([
        _firestoreService.deleteInvite(targetUid, roomId),
        _roomStore.updateRoom(newRoom),
      ]);

      state = state.copyWith(isLoading: false, error: null);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
