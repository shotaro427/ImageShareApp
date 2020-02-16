

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoomSettingsBloc {

  final DocumentSnapshot _roomInfo;

  RoomSettingsBloc(this._roomInfo);

  final _participantsController  = StreamController<List<DocumentSnapshot>>();
  Stream<List<DocumentSnapshot>> get participantsStream => _participantsController.stream;

  final StreamController<DocumentSnapshot> _myProfileController = StreamController();
  Stream<DocumentSnapshot> get myProfileStream => _myProfileController.stream;

  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingStream => _loadingController.stream;

  void fetchRoomMembersWithLoading() async {
    _loadingController.sink.add(LoadingType.LOADING);
    _participantsController.sink.add(await _fetchRoomMembers());
    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  /// 所属しているメンバーを取得する
  Future<List<DocumentSnapshot>> _fetchRoomMembers() async {

    final List<DocumentReference> _refs = [];
    final List<DocumentSnapshot> _participants = [];

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final String _userId = _prefs.getString('uid') ?? "";

    Query _membersQuery = Firestore.instance
        .document(_roomInfo.reference.path)
        .collection('participants');

    // 参加者の参照を取得
    await _membersQuery.getDocuments().then((data) {
      if (data.documents.length > 0) {
        _refs.addAll(data.documents.map((e) => e.data['user']));
      }
    });

    for (final ref in _refs) {
      await ref.get().then((data) {
        // 自分以外のメンバーを追加
        if (data.data['userId'].toString() == _userId) {
          _myProfileController.sink.add(data);
        } else {
          _participants.add(data);
        }
      }).catchError((e) {
        debugPrint(e.toString());
      });
    }
    return _participants;
  }

  void dispose() {
    _participantsController.close();
    _myProfileController.close();
    _loadingController.close();
  }
}
