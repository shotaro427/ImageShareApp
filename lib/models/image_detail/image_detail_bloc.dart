

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_detail_bloc.freezed.dart';

@freezed
abstract class ImageDetailState with _$ImageDetailState {
  const factory ImageDetailState() = _ImageDetailState;
  const factory ImageDetailState.loading() = Loading;
  const factory ImageDetailState.viewing({@required ImageEntity imageEntity}) = Success;
  const factory ImageDetailState.editing({@required ImageEntity imageEntity}) = Editing;
  const factory ImageDetailState.error({@Default('') String message}) = ErrorDetails;
}

class ImageDetailStateNotifier extends StateNotifier<ImageDetailState> {

  final ImageDetailRepository _repository;

  final RoomInfoEntity _roomInfoEntity;
  final ImageEntity _imageEntity;

  ImageDetailStateNotifier(this._imageEntity, this._roomInfoEntity, this._repository): super(const ImageDetailState()) {
    titleController.text =  (_imageEntity.title != null) ? _imageEntity.title : "名無し";
    memoController.text = (_imageEntity.memo != null) ? _imageEntity.memo : "";
  }

  // タイトルとメモの入力関連のController
  final TextEditingController titleController = TextEditingController();
  final TextEditingController memoController = TextEditingController();

  /// viewingモードとeditingモードを切り替える
  void switchingMode(bool toEditingMode, {bool withSave = false}) async {
    if (toEditingMode) {
      // editingモードに変更
      state = ImageDetailState.editing(imageEntity: _imageEntity);
    } else if (withSave) {
      // ローディング
      state = const ImageDetailState.loading();
      try {
        // 投稿を更新
        final ImageEntity _newImage = await _updateImageInfo();
        // viewingモードに変更
        state = ImageDetailState.viewing(imageEntity: _newImage);
      } catch(e) {
        // エラー時の処理
        log(e.toString());
        state = ImageDetailState.error(message: e.toString());
      }
    } else {
      // viewingモードに変更
      state = ImageDetailState.viewing(imageEntity: _imageEntity);
    }
  }

  /// 編集した情報に投稿を更新する処理
  Future<ImageEntity> _updateImageInfo() async {

    final String _title = (titleController.text.isEmpty || titleController.text == null) ? '名無し' : titleController.text.toString();
    final String _memo = (memoController.text.isEmpty || memoController.text == null) ? '' : memoController.text.toString();

    // repositoryからfirestoreに保存する関数を呼び出す
    final _newImage = await _repository._updateFirestore(_imageEntity, _roomInfoEntity, _title, _memo);

    return _imageEntity.copyWith(
        title: _newImage.title,
        memo: _newImage.memo,
        updated_at: _newImage.updated_at
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    memoController.dispose();
  }
}

class ImageDetailRepository {

  /// 該当の投稿の情報を上書きする処理
  Future<ImageEntity> _updateFirestore(ImageEntity imageEntity, RoomInfoEntity roomInfoEntity, String title, String memo) async {
    await Firestore.instance
        .document('rooms/${roomInfoEntity.roomId}/images/${imageEntity.image_id}')
        .updateData({
          'title': title,
          'memo': memo,
          'updated_at': DateTime.now().millisecondsSinceEpoch.toString()
        });
    final document = await Firestore.instance.document('rooms/${roomInfoEntity.roomId}/images/${imageEntity.image_id}').get();

    return ImageEntity.fromJson(document.data);
  }
}
