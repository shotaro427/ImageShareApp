// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_tag_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagState _$_$_TagStateFromJson(Map<String, dynamic> json) {
  return _$_TagState(
    tagName: json['tagName'] as String ?? '',
    isSelected: json['isSelected'] as bool ?? false,
    hexColor: json['hexColor'] as String ?? '#ffffff',
  );
}

Map<String, dynamic> _$_$_TagStateToJson(_$_TagState instance) =>
    <String, dynamic>{
      'tagName': instance.tagName,
      'isSelected': instance.isSelected,
      'hexColor': instance.hexColor,
    };
