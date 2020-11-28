import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/constants/plan.dart';
import 'package:image_share_app/model/controllers/post_top_controller/post_top_state.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final postTopController = StateNotifierProvider((ref) {
  final _roomStore = ref.watch(roomStore.state);
  return PostTopController(
    FirestoreService(),
    _roomStore,
  );
});

class PostTopController extends StateNotifier<PostTopState> {
  PostTopController(this._firestoreService, this._roomStore)
      : super(const PostTopState()) {
    getPosts();
  }

  final FirestoreService _firestoreService;
  final RoomState _roomStore;

  Future<void> getPosts({String query}) async {
    state = state.copyWith(isLoading: true);
    try {
      final posts =
          await _firestoreService.getPosts(_roomStore.id, query: query);

      print('get posts ${PlanInfo(Plan.free).totalPostsCount > posts.length}');
      state = state.copyWith(
        isLoading: false,
        error: null,
        posts: posts,
        canPost: PlanInfo(Plan.free).totalPostsCount > posts.length,
      );
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
