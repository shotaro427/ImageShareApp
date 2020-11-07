import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/self_editing_controller/self_editing_state.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/pages/self_editing/self_editing_page.dart';
import 'package:state_notifier/state_notifier.dart';

final selfEditingController = StateNotifierProvider((ref) {
  final user = ref.watch(userStore.state);
  return SelfEditingController(
    user,
  );
});

class SelfEditingController extends StateNotifier<SelfEditingState> {
  SelfEditingController(
    this._user,
  ) : super(const SelfEditingState()) {
    nameController.text = _user.name;
    emailController.text = _user.email;
    idController.text = _user.id;
  }

  final UserState _user;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final idController = TextEditingController();

  TextEditingController editController(EditType type) {
    switch (type) {
      case EditType.name:
        return nameController;
      case EditType.email:
        return emailController;
      case EditType.id:
        return idController;
      default:
        return TextEditingController();
    }
  }

  Future<void> validate(String value, EditType type) async {
    if (value.length < 1) {
      state = state.copyWith(validate: formContent(type) + 'を入力してください');
      return;
    }

    switch (type) {
      case EditType.name:
        state = state.copyWith(validate: null);
        break;
      case EditType.email:
        state = state.copyWith(
            validate: !value.contains('@') ? 'アットマーク「＠」がありません。' : null);
        break;
      case EditType.id:
        if (value.length > 13) {
          state = state.copyWith(validate: '招待IDは12文字以内です');
        } else {
          state = state.copyWith(validate: null);
        }
        break;
      default:
        state = state.copyWith(validate: null);
    }
  }

  String formContent(EditType type) {
    switch (type) {
      case EditType.name:
        return '名前';
      case EditType.email:
        return 'メールアドレス';
      case EditType.id:
        return 'ID';
      default:
        return '';
    }
  }
}
