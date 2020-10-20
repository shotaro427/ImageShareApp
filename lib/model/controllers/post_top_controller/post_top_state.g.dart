// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_top_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostTopState _$_$_PostTopStateFromJson(Map<String, dynamic> json) {
  return _$_PostTopState(
    isLoading: json['isLoading'] as bool ?? false,
    error: json['error'] as String,
    posts: (json['posts'] as List)
        ?.map((e) =>
            e == null ? null : PostState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_PostTopStateToJson(_$_PostTopState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'error': instance.error,
      'posts': instance.posts,
    };
