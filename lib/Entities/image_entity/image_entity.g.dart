// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageEntity _$_$_ImageEntityFromJson(Map<String, dynamic> json) {
  return _$_ImageEntity(
    title: json['title'] as String,
    memo: json['memo'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    originalUrl: json['originalUrl'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$_$_ImageEntityToJson(_$_ImageEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'memo': instance.memo,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'originalUrl': instance.originalUrl,
      'url': instance.url,
    };
