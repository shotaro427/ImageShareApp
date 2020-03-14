

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    await Firestore.instance.collection('users').where('uid', isEqualTo: _uid)
      .getDocuments()
      .then((docs) {
        if (docs.documents.first.reference != null) {
          docs.documents.first.reference.updateData({
            'name': name
          });
        }
      }).catchError((e) => debugPrint(e.toString()));
  }
}
