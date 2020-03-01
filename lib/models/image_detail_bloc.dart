

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';

class ImageDetailBloc extends AbstractLoadingBloc {

  final DocumentSnapshot imageDocument;

  ImageDetailBloc(this.imageDocument) {
    titleController.text =  (imageDocument.data['title'] != null) ? imageDocument.data['title'].toString() : "名無し";
    memoController.text = (imageDocument.data['memo'] != null) ? imageDocument.data['memo'].toString() : "";
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
      await _updateImageInfo(imageDocument);
      _loadingController.sink.add(LoadingType.COMPLETED);
    }
    _changeEditableStreamController.sink.add(!isEditingMode);
  }

  void cancelEdit() {
    _changeEditableStreamController.sink.add(false);
  }

  Future<void> _updateImageInfo(DocumentSnapshot imageInfo) {

    final String _title = (titleController.text.isEmpty || titleController.text == null) ? '名無し' : titleController.text.toString();
    final String _memo = (memoController.text.isEmpty || memoController.text == null) ? '' : memoController.text.toString();

    imageInfo.reference.updateData({
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