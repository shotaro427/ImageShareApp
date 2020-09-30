// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$_$_UserStateFromJson(Map<String, dynamic> json) {
  return _$_UserState(
    createdAt: json['createdAt'] as int,
    updateAt: json['updateAt'] as int,
    id: json['id'] as String ?? '',
    uid: json['uid'] as String ?? '',
    name: json['name'] as String ?? '',
    email: json['email'] as String ?? '',
    iconUrl: json['iconUrl'] as String ?? '',
    joinedRooms:
        (json['joinedRooms'] as List)?.map((e) => e as String)?.toList() ?? [],
    invitedRooms:
        (json['invitedRooms'] as List)?.map((e) => e as String)?.toList() ?? [],
  );
}

Map<String, dynamic> _$_$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'iconUrl': instance.iconUrl,
      'joinedRooms': instance.joinedRooms,
      'invitedRooms': instance.invitedRooms,
    };
