
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/repositories/room_settings_repositories/editing_profile_repository.dart';
import 'package:state_notifier/state_notifier.dart';
part 'editing_profile_bloc.freezed.dart';

@freezed
abstract class EditingProfileState with _$EditingProfileState {
  const factory EditingProfileState() = _EditingProfileState;
  const factory EditingProfileState.loading() = Loading;
  const factory EditingProfileState.success() = Success;
  const factory EditingProfileState.error({@Default('') String message}) = ErrorDetails;
}

class EditingProfileStateNotifier extends StateNotifier<EditingProfileState> {
  final EditingProfileRepository _repository;

  EditingProfileStateNotifier(this._repository): super(const EditingProfileState());

  void editingName(String name) async {
    // loading
    state = const EditingProfileState.loading();

    try {
      await _repository.setNickNameIntoFireStore(name);
      await _repository.setNickNameIntoFireStore(name);
      state = const EditingProfileState.success();
    } catch(e) {
      log(e.toString());
      state = EditingProfileState.error(message: e.toString());
    }
  }
}
