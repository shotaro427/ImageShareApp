
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

/// ルーム一覧を取得するための BLoC
class RoomListBloc extends AbstractLoadingBloc {
  final RoomListRepository _repository;

  /// ルーム一覧を取得したものを流すStreamControllerとStream
  final _roomListController = StreamController<List<DocumentSnapshot>>();
  Stream<List<DocumentSnapshot>> get roomListStream => _roomListController.stream;

  /// ローディング
  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  RoomListBloc(this._repository) {
    _loadingController.sink.add(LoadingType.NOT_YET);
  }

  /// ユーザーが所属するルームの一覧を取得する
  void fetchRooms() async {
    _loadingController.sink.add(LoadingType.LOADING);

    try {
      _roomListController.sink.add(await _repository.fetch());
    }catch(e) {
      debugPrint(e.toString());
    }

    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  void dispose() {
    _roomListController.close();
    _loadingController.close();
  }
}