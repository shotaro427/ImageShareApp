import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/room_list_controller/room_list_state.dart';
import 'package:state_notifier/state_notifier.dart';

final roomListController = StateNotifierProvider((ref) => RoomListController());

class RoomListController extends StateNotifier<RoomListState> {
  RoomListController() : super(const RoomListState());

  @override
  void dispose() {
    super.dispose();
  }
}
