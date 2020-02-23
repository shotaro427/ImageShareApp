

import 'dart:async';

class ImageDetailBloc {

  final StreamController<bool> _changeEditableStreamController = StreamController<bool>();
  Stream<bool> get _changeEditableStream => _changeEditableStreamController.stream;

  /// 編集可能かどうかの状態を操作する
  void changeEditableState(bool canEditable) {
    _changeEditableStreamController.sink.add(canEditable);
  }

  void dispose() {

  }
}