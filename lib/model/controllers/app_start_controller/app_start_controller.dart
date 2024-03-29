import 'dart:developer';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/pages/room_list/room_list_page.dart';
import 'package:image_share_app/services/index.dart';
import 'package:image_share_app/widget/organisms/advertising_banner.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_share_app/model/controllers/app_start_controller/app_start_state.dart';

// ignore: top_level_function_literal_block
final appStartController = StateNotifierProvider((ref) {
  final userProvider = ref.watch(userStore);

  return AppStartController(
    AppStartService(),
    FirestoreService(),
    userProvider,
  );
});

class AppStartController extends StateNotifier<AppStartState> {
  AppStartController(
    this.loginService,
    this.firestoreService,
    this.userStore,
  ) : super(const AppStartState()) {
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-9097303817244208~1620664005');

    myBanner
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );
  }

  final AppStartService loginService;
  final FirestoreService firestoreService;
  final UserController userStore;

  // ログイン画面への遷移
  void navigateToMailSignin(BuildContext context) =>
      Navigator.of(context).pushNamed('mailSignin');

  // 登録画面への遷移
  void navigateToMailSignup(BuildContext context) =>
      Navigator.of(context).pushNamed('mailSignup');

  // Googleでログイン
  Future<void> loginWithGoogle(GlobalKey<ScaffoldState> scaffoldKey) async {
    // ローディング
    state = state.copyWith(error: null, isLoading: true);

    try {
      // ログイン
      final UserState _user = (await loginService.loginWithGoogle());

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

  // Appleでログイン
  Future<void> loginWithApple(GlobalKey<ScaffoldState> scaffoldKey) async {
    // ローディング
    state = state.copyWith(error: null, isLoading: true);

    try {
      // ログイン
      final UserState _user = (await loginService.loginWithApple());

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
    try {
      myBanner.dispose();
    } catch (e) {}
    super.dispose();
  }
}
