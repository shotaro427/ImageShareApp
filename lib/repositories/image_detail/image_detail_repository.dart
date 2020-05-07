import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';

class ImageDetailRepository {
  /// 該当の投稿の情報を上書きする処理
  Future<ImageEntity> updateFirestore(ImageEntity imageEntity,
      RoomInfoEntity roomInfoEntity, String title, String memo) async {
    await Firestore.instance
        .document(
            'rooms/${roomInfoEntity.roomId}/images/${imageEntity.image_id}')
        .updateData({
      'title': title,
      'memo': memo,
      'updated_at': DateTime.now().millisecondsSinceEpoch.toString()
    });
    final document = await Firestore.instance
        .document(
            'rooms/${roomInfoEntity.roomId}/images/${imageEntity.image_id}')
        .get();

    return ImageEntity.fromJson(document.data);
  }

  /// 投稿を削除する
  Future<void> deleteImage(
      ImageEntity imageEntity, RoomInfoEntity roomInfoEntity) async {
    // FireStoreから投稿を削除
    await Firestore.instance
        .document(
            'rooms/${roomInfoEntity.roomId}/images/${imageEntity.image_id}')
        .delete();

    // Cloud Storageから画像を削除
    await FirebaseStorage.instance
        .ref()
        .child('roomImages/${roomInfoEntity.roomId}/${imageEntity.created_at}')
        .delete();

    // Cloud Storageからサムネイル画像を削除
    await FirebaseStorage.instance
        .ref()
        .child(
            'roomImages/${roomInfoEntity.roomId}/thumbnails/${imageEntity.created_at}_200x200')
        .delete();
  }
}
