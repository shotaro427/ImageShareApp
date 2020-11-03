import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/group_setting_controller/group_setting_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final groupSettingController = StateNotifierProvider((ref) {
  final _room = ref.watch(roomStore.state);
  return GroupSettingController(
    _room,
    FirestoreService(),
  );
});

class GroupSettingController extends StateNotifier<GroupSettingState> {
  GroupSettingController(this._room, this._firestoreService)
      : super(const GroupSettingState()) {
    getMember();
  }

  final RoomState _room;
  final FirestoreService _firestoreService;

  Future<void> getMember() async {
    log('pass getmember');
    state = state.copyWith(isLoading: true);
    try {
      final member = await _firestoreService.getMember(_room.member);
      final invited = await _firestoreService.getMember(_room.invited);
      log('member: ${member}, invited: ${invited}');
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
}
