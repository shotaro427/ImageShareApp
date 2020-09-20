// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomState _$_$_RoomStateFromJson(Map<String, dynamic> json) {
  return _$_RoomState(
    createdAt: json['createdAt'] as int,
    updateAt: json['updateAt'] as int,
    id: json['id'] as String ?? '',
    name: json['name'] as String ?? '',
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList() ?? [],
    member: (json['member'] as List)?.map((e) => e as String)?.toList() ?? [],
    invited: (json['invited'] as List)?.map((e) => e as String)?.toList() ?? [],
  );
}

Map<String, dynamic> _$_$_RoomStateToJson(_$_RoomState instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'id': instance.id,
      'name': instance.name,
      'tags': instance.tags,
      'member': instance.member,
      'invited': instance.invited,
    };
