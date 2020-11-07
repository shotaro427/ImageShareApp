import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/self_editing_controller/self_editing_state.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/pages/self_editing/self_editing_page.dart';
import 'package:state_notifier/state_notifier.dart';

final selfEditingController = StateNotifierProvider((ref) {
  final user = ref.watch(userStore.state);
  final action = ref.watch(userStore);
  return SelfEditingController(
    user,
    action,
  );
});

class SelfEditingController extends StateNotifier<SelfEditingState> {
  SelfEditingController(
    this._user,
    this._controller,
  ) : super(const SelfEditingState()) {
    nameController.text = _user.name;
    emailController.text = _user.email;
    idController.text = _user.id;
  }

  final UserState _user;
  final UserController _controller;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final idController = TextEditingController();

  Future<void> saveUserInfo(EditType type, GlobalKey<ScaffoldState> key) async {
    state = state.copyWith(isLoading: true);
    try {
      final UserState newUser = _user.copyWith(
        name: nameController.text,
        email: emailController.text,
        id: idController.text,
      );
      await _controller.updateUser(newUser);

      state = state.copyWith(isLoading: false, error: null);
      Navigator.of(key.currentContext).pop<bool>(true);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
      Navigator.of(key.currentContext).pop<bool>(false);
    }
  }

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
