import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/main.development.dart';
import 'package:image_share_app/model/controllers/self_setting_controller/self_setting_state.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

final selfSettingController = StateNotifierProvider((ref) {
  final _user = ref.watch(userStore.state);
  final _userStore = ref.watch(userStore);
  return SelfSettingController(
    _user,
    _userStore,
    FirestoreService(),
    FilePickerService(),
    AppStartService(),
  );
});

class SelfSettingController extends StateNotifier<SelfSettingState> {
  SelfSettingController(
    this._user,
    this._userController,
    this._firestoreService,
    this._filePickerService,
    this._appStartService,
  ) : super(const SelfSettingState());

  final UserState _user;
  final UserController _userController;
  final FirestoreService _firestoreService;
  final FilePickerService _filePickerService;
  final AppStartService _appStartService;

  Future<void> changeUserIcon() async {
    state = state.copyWith(isLoading: true);
    try {
      final iconFile = await _filePickerService.getSingleImageFile();
      final newUser = await _firestoreService.setUserIcon(iconFile, _user);
      await _userController.updateUser(newUser);

      state = state.copyWith(isLoading: false, error: null);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> logout(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      await _appStartService.logout();
      resetLoginInfo();
      state = state.copyWith(isLoading: false, error: null);

      Navigator.of(context).pushNamedAndRemoveUntil(
        'appStart',
        (route) => false,
      );
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
