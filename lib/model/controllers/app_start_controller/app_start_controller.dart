import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/pages/room_list/room_list_page.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_share_app/model/controllers/app_start_controller/app_start_state.dart';

final appStartController = StateNotifierProvider(
  (ref) => AppStartController(
    AppStartService(),
    FirestoreService(),
  ),
);

class AppStartController extends StateNotifier<AppStartState> {
  AppStartController(
    this.loginService,
    this.firestoreService,
  ) : super(const AppStartState());

  final AppStartService loginService;
  final FirestoreService firestoreService;

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
      await firestoreService.createNewUser(_user);
      state = state.copyWith(error: null, isLoading: false);

      if (state.error == null) {
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
      await firestoreService.createNewUser(_user);
      state = state.copyWith(error: null, isLoading: false);

      if (state.error == null) {
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
}
