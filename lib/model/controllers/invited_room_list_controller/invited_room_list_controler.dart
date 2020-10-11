import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/invited_room_list_controller/invited_room_list_state.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final invitedRoomListController = StateNotifierProvider((ref) {
  final user = ref.watch(userStore.state);
  return InvitedRoomListController(
    FirestoreService(),
    user,
  );
});

class InvitedRoomListController extends StateNotifier<InvitedRoomState> {
  InvitedRoomListController(this.firestoreService, this.user)
      : super(const InvitedRoomState()) {
    getRooms();
  }

  final FirestoreService firestoreService;
  final UserState user;

  Future<void> getRooms() async {
    state = state.copyWith(isLoading: true);

    try {
      final groups = (await firestoreService.getRooms(
        user.uid,
        type: RoomType.invitedRooms,
      ));
      state = state.copyWith(isLoading: false, error: null, rooms: groups);
    } catch (e) {
      log(e.toString());
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
