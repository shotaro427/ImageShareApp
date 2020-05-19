import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/repositories/room_settings_repositories/add_member_repository.dart';
import 'package:state_notifier/state_notifier.dart';
part 'add_member_bloc.freezed.dart';

@freezed
abstract class AddMemberState with _$AddMemberState {
  const factory AddMemberState() = _AddMemberState;
  const factory AddMemberState.loading() = Loading;
  const factory AddMemberState.success() = Success;
  const factory AddMemberState.error({@Default('') String message}) =
      ErrorDetails;
}

class AddMemberStateNotifier extends StateNotifier<AddMemberState> {
  final AddMemberRepository _repository;
  AddMemberStateNotifier(this._repository) : super(const AddMemberState());

  /// メンバーをemailで検索して新たに招待する処理
  Future<void> inviteUser(String userId, RoomInfoEntity roomInfoEntity) async {
    state = const AddMemberState.loading();

    try {
      await _repository.inviteUser(userId, roomInfoEntity);
      state = const AddMemberState.success();
    } catch (e) {
      log(e.toString());
      state = AddMemberState.error(message: e.toString());
    }
  }
}
