

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_detail_bloc.freezed.dart';

@freezed
abstract class ImageDetailState with _$ImageDetailState {
  const factory ImageDetailState() = _ImageDetailState;
  const factory ImageDetailState.loading() = Loading;
  const factory ImageDetailState.success({@required ImageEntity imageEntity}) = Success;
  const factory ImageDetailState.editing({@required ImageEntity imageEntity}) = Editing;
  const factory ImageDetailState.error({@Default('') String message}) = ErrorDetails;
}

class ImageDetailBloc extends AbstractLoadingBloc {

  final ImageEntity _entity;
  final RoomInfoEntity _roomInfoEntity;

  ImageDetailBloc(this._entity, this._roomInfoEntity) {
    titleController.text =  (_entity.title != null) ? _entity.title : "名無し";
    memoController.text = (_entity.memo != null) ? _entity.memo : "";
  }

  final StreamController<bool> _changeEditableStreamController = StreamController<bool>();
  Stream<bool> get changeEditableStream => _changeEditableStreamController.stream;

  final _loadingController = StreamController<LoadingType>();
  Stream<LoadingType> get loadingValue => _loadingController.stream;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController memoController = TextEditingController();

  /// 編集可能かどうかの状態を操作する
  void changeEditableState(bool isEditingMode) async {
    // 編集モードの時
    if (isEditingMode) {
      _loadingController.sink.add(LoadingType.LOADING);
      await _updateImageInfo();
      _loadingController.sink.add(LoadingType.COMPLETED);
    }
    _changeEditableStreamController.sink.add(!isEditingMode);
  }

  void cancelEdit() {
    _changeEditableStreamController.sink.add(false);
  }

  Future<void> _updateImageInfo() async {

    final String _title = (titleController.text.isEmpty || titleController.text == null) ? '名無し' : titleController.text.toString();
    final String _memo = (memoController.text.isEmpty || memoController.text == null) ? '' : memoController.text.toString();

    await Firestore.instance
        .document('rooms/${_roomInfoEntity.roomId}/images/${_entity.image_id}')
        .updateData({
          'title': _title,
          'memo': _memo,
          'updated_at': DateTime.now().millisecondsSinceEpoch.toString()
        });
  }

  void dispose() {
    _changeEditableStreamController.close();
    _loadingController.close();
  }
}