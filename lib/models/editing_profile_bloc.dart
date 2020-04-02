

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

class EditingProfileBloc extends AbstractLoadingBloc {

  final EditingProfileRepository _repository;

  final StreamController<LoadingType> _loadingController = StreamController();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  EditingProfileBloc(this._repository);

  void editingName(String name) async {
    _loadingController.sink.add(LoadingType.LOADING);
    await _repository.setNickNameIntoLocalStorage(name);
    await _repository.setNickNameIntoFireStore(name);
    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  void dispose() {
    _loadingController.close();
  }
}

class EditingProfileRepository {

  /// ローカルストレージに名前を保存する関数
  void setNickNameIntoLocalStorage(String name) async {

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('name', name);
  }

  /// FireStoreに名前を保存する関数
  void setNickNameIntoFireStore(String name) async {

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final _uid = _prefs.getString('uid');

    final QuerySnapshot _querySnapshot = await Firestore.instance.collection('users').where('uid', isEqualTo: _uid).getDocuments();

    if (_querySnapshot.documents.first.reference != null) {
      await  _querySnapshot.documents.first.reference.updateData({
        'name': name,
      });
    }
  }
}
