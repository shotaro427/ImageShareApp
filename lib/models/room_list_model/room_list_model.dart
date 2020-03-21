
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

/// ルーム一覧を取得するための BLoC
class RoomListBloc extends AbstractLoadingBloc {
  final RoomListRepository _repository;

  /// ルーム一覧を取得したものを流すStreamControllerとStream
  final _roomListController = StreamController<List<DocumentSnapshot>>.broadcast();
  Stream<List<DocumentSnapshot>> get roomListStream => _roomListController.stream;

  /// 招待されているルーム一覧を取得したものを流すStreamControllerとStream
  final _waitingRoomListController = StreamController<List<DocumentSnapshot>>.broadcast();
  Stream<List<DocumentSnapshot>> get waitingRoomStream => _waitingRoomListController.stream;

  /// ローディング
  final _loadingController = StreamController<LoadingType>.broadcast();
  Stream<LoadingType> get loadingValue => _loadingController.stream.asBroadcastStream();

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

  /// ユーザーが招待を受けているルーム一覧を取得する
  void fetchWaitingRooms() async {
    _loadingController.sink.add(LoadingType.LOADING);

    try {
      _waitingRoomListController.sink.add(await _repository.fetchWaitingRooms());
    } catch(e) {
      debugPrint(e.toString());
    }

    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  void joinRoom(DocumentReference roomRef) async {
    _loadingController.sink.add(LoadingType.LOADING);
    await _repository.joinRoom(roomRef);
    _loadingController.sink.add(LoadingType.COMPLETED);
  }

  void dispose() {
    _roomListController.close();
    _loadingController.close();
    _waitingRoomListController.close();
  }
}