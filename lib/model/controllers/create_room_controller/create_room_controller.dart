import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/create_room_controller/create_room_state.dart';

import 'package:state_notifier/state_notifier.dart';

final createRoomController =
    StateNotifierProvider((ref) => CreateRoomController());

class CreateRoomController extends StateNotifier<CreateRoomState> {
  CreateRoomController() : super(const CreateRoomState());

  final nameInputController = TextEditingController();

  Future<void> createRoom(GlobalKey<ScaffoldState> scaffoldKey) {
    // TODO: グループ作成のロジック
  }

  @override
  void dispose() {
    nameInputController.dispose();
    super.dispose();
  }
}
