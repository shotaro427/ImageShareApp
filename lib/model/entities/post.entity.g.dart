// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostState _$_$_PostStateFromJson(Map<String, dynamic> json) {
  return _$_PostState(
    createdAt: json['createdAt'] as int,
    updateAt: json['updateAt'] as int,
    id: json['id'] as String ?? '',
    title: json['title'] as String ?? '',
    description: json['description'] as String ?? '',
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList() ?? [],
    createUserId: json['createUserId'] as String ?? '',
    thumbnailUrl: json['thumbnailUrl'] as String ?? '',
    bgramMap: (json['bgramMap'] as Map<String, dynamic>)?.map(
          (k, e) => MapEntry(k, e as String),
        ) ??
        {},
  );
}

Map<String, dynamic> _$_$_PostStateToJson(_$_PostState instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'createUserId': instance.createUserId,
      'thumbnailUrl': instance.thumbnailUrl,
      'bgramMap': instance.bgramMap,
    };
