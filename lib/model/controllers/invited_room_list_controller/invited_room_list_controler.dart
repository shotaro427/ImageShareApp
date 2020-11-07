import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/invited_room_list_controller/invited_room_list_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final invitedRoomListController = StateNotifierProvider((ref) {
  final user = ref.watch(userStore.state);
  final userController = ref.watch(userStore);
  return InvitedRoomListController(
    FirestoreService(),
    user,
    userController,
  );
});

class InvitedRoomListController extends StateNotifier<InvitedRoomState> {
  InvitedRoomListController(
    this.firestoreService,
    this.user,
    this.userStore,
  ) : super(const InvitedRoomState()) {
    getRooms();
  }

  final FirestoreService firestoreService;
  final UserState user;
  final UserController userStore;

  Future<void> getRooms() async {
    state = state.copyWith(isLoading: true);

    try {
      final groups = (await firestoreService.getRooms(
        user,
        type: RoomType.invitedRooms,
      ));
      state = state.copyWith(isLoading: false, error: null, rooms: groups);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> participate(RoomState room) async {
    state = state.copyWith(isLoading: true);
    try {
      await firestoreService.participateRoom(room, user.uid);

      final List<String> newInvitedRooms = List.from(user.invitedRooms);
      newInvitedRooms.removeWhere((element) => element == room.id);

      final List<String> newJoinedRooms = List.from(user.joinedRooms);
      if (!newJoinedRooms.contains(user.uid)) {
        newJoinedRooms.add(room.id);
      }

      final newUser = user.copyWith(
        invitedRooms: newInvitedRooms,
        joinedRooms: newJoinedRooms,
      );

      log(newUser.toString());

      await userStore.updateUser(newUser);
      state = state.copyWith(isLoading: false, error: null);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
