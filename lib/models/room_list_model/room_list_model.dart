
import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/repositories/room_list_repository/joined_room_list_repository.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import  'package:state_notifier/state_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'room_list_model.freezed.dart';

@freezed
abstract class JoinedRoomListState with _$JoinedRoomListState {
  const factory JoinedRoomListState() = _JoinedRoomListState;
  const factory JoinedRoomListState.loading() = Loading;
  const factory JoinedRoomListState.success({@required List<RoomInfoEntity> rooms}) = Success;
  const factory JoinedRoomListState.error({@Default('') String message}) = ErrorDetails;
}

class JoinedRoomListStateNotifier extends StateNotifier<JoinedRoomListState> {

  final RoomListRepository _repository;

  JoinedRoomListStateNotifier(this._repository): super(const JoinedRoomListState());

  void fetchJoinedRooms() async {
    state = const JoinedRoomListState.loading();

    try {
      final _rooms = await _repository.fetchJoinedRooms();
      state = JoinedRoomListState.success(rooms: _rooms);

    } catch(e) {
      log(e.toString());
      state = JoinedRoomListState.error(message: e.toString());

    }
  }
}

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
//      _roomListController.sink.add(await _repository.fetchJoinedRooms());
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