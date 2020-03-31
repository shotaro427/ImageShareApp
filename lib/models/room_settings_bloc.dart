
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/user_entity/user_entity.dart';
import 'package:image_share_app/repositories/room_settings_repositories/room_setting_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
  const factory RoomSettingsState.error({@Default('') String message}) = ErrorDetails;
}

class RoomSettingsStateNotifier extends StateNotifier<RoomSettingsState> {

  final RoomSettingsRepository _repository;
  RoomSettingsStateNotifier(this._repository): super(const RoomSettingsState()) {
    fetchRoomMembers();
  }

  /// グループのメンバーを取得する
  void fetchRoomMembers() async {

    state = const RoomSettingsState.loading();

    try {
      final _members = await _repository.fetchRoomMembers();
      final UserEntity _myProfile = _members.removeAt(0);
      state = RoomSettingsState.success(myProfile: _myProfile, roomMembers: _members);
    } catch(e) {
      log(e.toString());
      state = RoomSettingsState.error(message: e.toString());
    }
  }
}
