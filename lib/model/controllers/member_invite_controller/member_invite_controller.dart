import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/member_invite_controller/member_invite_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final memberInviteController = StateNotifierProvider((ref) {
  final room = ref.watch(roomStore.state);
  final _roomStore = ref.watch(roomStore);
  return MemberInviteController(
    room,
    _roomStore,
    FirestoreService(),
  );
});

class MemberInviteController extends StateNotifier<MemberInviteState> {
  MemberInviteController(
    this._room,
    this._roomStore,
    this._firestoreService,
  ) : super(const MemberInviteState());

  final RoomState _room;
  final RoomController _roomStore;
  final FirestoreService _firestoreService;
  final TextEditingController controller = TextEditingController();

  Future<void> invite(GlobalKey<ScaffoldState> key) async {
    state = state.copyWith(isLoading: true);
    try {
      final newRoom =
          await _firestoreService.inviteUser(_room, controller.text);

      await _roomStore.updateRoom(newRoom);
      controller.clear();
      state = state.copyWith(isLoading: false, error: null);

      Navigator.of(key.currentContext).pop();
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
