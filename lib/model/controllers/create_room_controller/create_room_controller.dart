import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_room_controller/create_room_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';

import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final createRoomController = StateNotifierProvider((ref) {
  final _userStore = ref.watch(userStore);
  final _user = ref.watch(userStore.state);
  return CreateRoomController(
    FirestoreService(),
    _userStore,
    _user,
  );
});

class CreateRoomController extends StateNotifier<CreateRoomState> {
  CreateRoomController(
    this.firestoreService,
    this._userStore,
    this._user,
  ) : super(const CreateRoomState());

  final FirestoreService firestoreService;
  final UserState _user;
  final UserController _userStore;

  final nameInputController = TextEditingController();

  Future<void> createRoom(GlobalKey<ScaffoldState> scaffoldKey) async {
    state = state.copyWith(isLoading: true);

    try {
      // グループを作成
      final room = RoomState(name: nameInputController.text);
      // firestoreに保存
      final newRoom =
          (await firestoreService.saveRoomInfo(room, uid: _user.uid));

      // 新規作成したグループのIDを追加
      final List<String> newJoinedRooms = List.from(_user.joinedRooms);
      log(_user.joinedRooms.toString());
      newJoinedRooms.add(newRoom.id);
      final newUser = _user.copyWith(joinedRooms: newJoinedRooms);

      // userを保存
      await _userStore.updateUser(newUser);

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
    super.dispose();
    nameInputController.dispose();
  }
}
