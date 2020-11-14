// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostDetailState _$_$_PostDetailStateFromJson(Map<String, dynamic> json) {
  return _$_PostDetailState(
    error: json['error'] as String,
    isLoading: json['isLoading'] as bool ?? false,
    currentIndex: json['currentIndex'] as int ?? 0,
    imageIndex: json['imageIndex'] as int ?? 0,
    images: (json['images'] as List)
            ?.map((e) => e == null
                ? null
                : ImageState.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    pdfs: (json['pdfs'] as List)
            ?.map((e) =>
                e == null ? null : PdfState.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_PostDetailStateToJson(_$_PostDetailState instance) =>
    <String, dynamic>{
      'error': instance.error,
      'isLoading': instance.isLoading,
      'currentIndex': instance.currentIndex,
      'imageIndex': instance.imageIndex,
      'images': instance.images,
      'pdfs': instance.pdfs,
    };
