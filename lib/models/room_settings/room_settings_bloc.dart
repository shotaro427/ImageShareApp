import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:image_share_app/repositories/room_settings_repositories/room_setting_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
part 'room_settings_bloc.freezed.dart';

@freezed
abstract class RoomSettingsState with _$RoomSettingsState {
  const factory RoomSettingsState() = _RoomSettingsState;
  const factory RoomSettingsState.loading() = Loading;
  const factory RoomSettingsState.success({
    @required UserEntity myProfile,
    @required List<UserEntity> roomMembers,
  }) = Success;
  const factory RoomSettingsState.error({@Default('') String message}) =
      ErrorDetails;
}

class RoomSettingsStateNotifier extends StateNotifier<RoomSettingsState> {

  Map<String, List<UserEntity>> _profiles = {};

  final RoomSettingsRepository _repository;
  RoomSettingsStateNotifier(this._repository)
      : super(const RoomSettingsState()) {
    fetchRoomMembers();
  }

  /// グループのメンバーを取得する
  void fetchRoomMembers() async {
    state = const RoomSettingsState.loading();

    try {
      final Map<String, List<UserEntity>> _members =
          await _repository.fetchRoomMembers();
      final UserEntity _myProfile = _members['you'].first;

      _profiles = {'myProfile': [_myProfile], 'roomMembers': _members['members']};
      state = RoomSettingsState.success(
          myProfile: _myProfile, roomMembers: _members['members']);
    } catch (e) {
      log(e.toString());
      state = RoomSettingsState.error(message: e.toString());
    }
  }

  /// 退会させる処理 
  void forceWithdrawal(String uid) async {
    state = const RoomSettingsState.loading();

    try {
      await _repository.forceWithdrawal(uid);

      _profiles['roomMembers'].removeWhere((element) => element.uid == uid);
      state = RoomSettingsState.success(myProfile: _profiles['myProfile'].first, roomMembers: _profiles['roomMembers']);
    } catch(e) {
      log(e.toString());
      state = RoomSettingsState.error(message: e.toString());
    }
  }

  /// 退会する処理 
  void withdrawSelf() async {
    state = const RoomSettingsState.loading();

    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      final _uid = _prefs.getString('uid');

      await _repository.forceWithdrawal(_uid);

      state = RoomSettingsState.success(myProfile: _profiles['myProfile'].first, roomMembers: []);
    } catch(e) {
      log(e.toString());
      state = RoomSettingsState.error(message: e.toString());
    }
  }
}
