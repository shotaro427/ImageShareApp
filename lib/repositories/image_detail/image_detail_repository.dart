

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';

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