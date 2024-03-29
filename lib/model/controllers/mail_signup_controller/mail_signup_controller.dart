import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/mail_signup_controller/mail_signup_state.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/pages/room_list/room_list_page.dart';
import 'package:image_share_app/services/firestore_service.dart';
import 'package:image_share_app/services/signin_service.dart';
import 'package:image_share_app/widget/organisms/advertising_banner.dart';
import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final mailSignupController = StateNotifierProvider((ref) {
  final userProvider = ref.watch(userStore);

  return MailSignupController(
    AppStartService(),
    FirestoreService(),
    userProvider,
  );
});

class MailSignupController extends StateNotifier<MailSignupState> {
  MailSignupController(
    this.loginService,
    this.firestoreService,
    this.userStore,
  ) : super(const MailSignupState());

  final AppStartService loginService;
  final FirestoreService firestoreService;
  final UserController userStore;

  // メールアドレスとパスワードを入力する箇所のController
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  // ユーザーを登録
  Future<void> signupWithMailAdress(
      GlobalKey<ScaffoldState> scaffoldKey) async {
    // ローディング
    state = state.copyWith(error: null, isLoading: true);

    try {
      // 登録
      final UserState _user = await loginService.signupWithMailAdress(
        emailInputController.text,
        passwordInputController.text,
      );

      // ユーザー情報を保存
      await userStore.updateUser(_user);
      state = state.copyWith(error: null, isLoading: false);

      if (state.error == null) {
        try {
          myBanner.dispose();
        } catch (e) {}
        Navigator.of(scaffoldKey.currentContext).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => RoomListPage()),
          (_) => false,
        );
      }
    } catch (e) {
      log(e.toString());
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  @override
  void dispose() {
    emailInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }
}
