import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/mail_signin_controller/mail_signin_state.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/pages/room_list/room_list_page.dart';
import 'package:image_share_app/services/index.dart';
import 'package:image_share_app/widget/organisms/advertising_banner.dart';
import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final mailSigninController = StateNotifierProvider((ref) {
  final userProvider = ref.watch(userStore);
  return MailSigninController(AppStartService(), userProvider);
});

class MailSigninController extends StateNotifier<MailSigninState> {
  MailSigninController(
    this.loginService,
    this.userStore,
  ) : super(const MailSigninState());

  final AppStartService loginService;
  final UserController userStore;

  // メールアドレスとパスワードを入力する箇所のController
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  // メールアドレスでサインイン
  Future<void> loginWithMailAdress(GlobalKey<ScaffoldState> scaffoldKey) async {
    // ローディング
    state = state.copyWith(error: null, isLoading: true);

    try {
      // ログイン
      final user = (await loginService.loginWithMailAdress(
        emailInputController.text,
        passwordInputController.text,
      ));

      userStore.updateState(user);
      state = state.copyWith(error: null, isLoading: false);

      if (state.error == null) {
        myBanner.dispose();
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
