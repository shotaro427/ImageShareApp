

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ImageDetailBloc {

  final DocumentSnapshot imageDocument;

  ImageDetailBloc(this.imageDocument) {
    titleController.text =  (imageDocument.data['title'] != null) ? imageDocument.data['title'].toString() : "名無し";
    memoController.text = (imageDocument.data['memo'] != null) ? imageDocument.data['memo'].toString() : "";
  }

  final StreamController<bool> _changeEditableStreamController = StreamController<bool>();
  Stream<bool> get changeEditableStream => _changeEditableStreamController.stream;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController memoController = TextEditingController();

  /// 編集可能かどうかの状態を操作する
  void changeEditableState(bool isEditingMode) async {
    // 編集モードの時
    if (isEditingMode) {
      await _updateImageInfo(imageDocument);
    }
    _changeEditableStreamController.sink.add(!isEditingMode);
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
  }
}