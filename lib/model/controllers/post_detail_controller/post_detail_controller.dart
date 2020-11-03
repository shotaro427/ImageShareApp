import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_state.dart';
import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final postDetailController = StateNotifierProvider((ref) {
  return PostDetailController();
});

class PostDetailController extends StateNotifier<PostDetailState> {
  PostDetailController() : super(const PostDetailState());

  void switchIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
