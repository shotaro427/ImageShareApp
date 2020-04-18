
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';

class TopImageRepository {

  final String _roomId;

  TopImageRepository(this._roomId);

  Future<QuerySnapshot> fetchImages(List<ImageEntity> images, {@Default('') String keyWord}) {
    return _createImagesQuery(images, keyWord).getDocuments();
  }

  /// ページング状況に合わせてクエリを変更
  Query _createImagesQuery(List<ImageEntity> images, String keyWord) {
    // キーワードが指定されている時
    if (keyWord != null && keyWord.isNotEmpty) {
      // 1ページ以降のクエリ
      if (images.length > 0) {
        return Firestore.instance.collection('rooms/$_roomId/images')
            .where('title', isEqualTo: keyWord)
            .orderBy("created_at", descending: true)
            .startAfter([images.last.created_at])
            .limit(100);

      // 最初のクエリ
      } else {
        return Firestore.instance.collection('rooms/$_roomId/images')
            .where('title', isEqualTo: keyWord)
            .orderBy("created_at", descending: true)
            .limit(100);
      }
    } else {
      // 1ページ以降のクエリ
      if (images.length > 0) {
        return Firestore.instance.collection('rooms/$_roomId/images')
            .orderBy("created_at", descending: true)
            .startAfter([images.last.created_at])
            .limit(100);

      // 最初のクエリ
      } else {
        return Firestore.instance.collection('rooms/$_roomId/images')
            .orderBy("created_at", descending: true)
            .limit(100);
      }
    }
  }
}