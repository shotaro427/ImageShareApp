import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/room_list_controller/room_list_state.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final roomListController = StateNotifierProvider(
// ignore: top_level_function_literal_block
  (ref) {
    final user = ref.watch(userStore.state);
    return RoomListController(
      FirestoreService(),
      user,
    );
  },
);

class RoomListController extends StateNotifier<RoomListState> {
  RoomListController(this.firestoreService, this.user)
      : super(const RoomListState()) {
    getRooms();
  }

  final FirestoreService firestoreService;
  final UserState user;

  Future<void> getRooms() async {
    state = state.copyWith(isLoading: true);

    try {
      final groups = (await firestoreService.getRooms(user.uid));
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
