import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_room_controller/create_room_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';

import 'package:state_notifier/state_notifier.dart';

final createRoomController = StateNotifierProvider((ref) {
  final uid = ref.watch(userStore.state).uid;
  return CreateRoomController(
    FirestoreService(),
    uid,
  );
});

class CreateRoomController extends StateNotifier<CreateRoomState> {
  CreateRoomController(this.firestoreService, this.uid)
      : super(const CreateRoomState());

  final FirestoreService firestoreService;
  final String uid;

  final nameInputController = TextEditingController();

  Future<void> createRoom(GlobalKey<ScaffoldState> scaffoldKey) async {
    state = state.copyWith(isLoading: true);

    try {
      final room = RoomState(name: nameInputController.text);
      // Firestoreに保存
      await firestoreService.saveRoomInfo(room, uid);

      state = state.copyWith(error: null, isLoading: false);
      if (state.error == null) {
        Navigator.of(scaffoldKey.currentContext).pop();
      }
    } catch (e) {
      log(e.toString());
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  @override
  void dispose() {
    nameInputController.dispose();
    super.dispose();
  }
}
