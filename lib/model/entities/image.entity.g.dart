// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageState _$_$_ImageStateFromJson(Map<String, dynamic> json) {
  return _$_ImageState(
    createdAt: json['createdAt'] as int,
    updateAt: json['updateAt'] as int,
    id: json['id'] as String ?? '',
    imageUrl: json['imageUrl'] as String ?? '',
    createUserId: json['createUserId'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_ImageStateToJson(_$_ImageState instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'createUserId': instance.createUserId,
    };
