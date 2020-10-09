import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/room_list_controller/room_list_state.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final roomListController = StateNotifierProvider(
  (ref) => RoomListController(
    FirestoreService(),
  ),
);

class RoomListController extends StateNotifier<RoomListState> {
  RoomListController(this.firestoreService) : super(const RoomListState());

  final FirestoreService firestoreService;

  Future<void> getRooms() async {
    state = state.copyWith(isLoading: true);

    try {
      state = state.copyWith(isLoading: false, error: null);
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
