

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';

class TopImageRepository {

  final String _roomId;

  TopImageRepository(this._roomId);

  Future<QuerySnapshot> fetchImages(List<ImageEntity> images) {
    return _createImagesQuery(images).getDocuments();
  }

  /// ページング状況に合わせてクエリを変更
  Query _createImagesQuery(List<ImageEntity> images) {
    if (images.length > 0) {
      return Firestore.instance
          .collection('rooms')
          .document(_roomId)
          .collection("images")
          .orderBy("created_at", descending: true)
          .startAfter([images.last.created_at])
          .limit(20);
    } else {
      return Firestore.instance
          .collection('rooms')
          .document(_roomId)
          .collection("images")
          .orderBy("created_at", descending: true)
          .limit(20);
    }
  }
}