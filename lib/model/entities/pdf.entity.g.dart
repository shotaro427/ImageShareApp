// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PdfState _$_$_PdfStateFromJson(Map<String, dynamic> json) {
  return _$_PdfState(
    createdAt: json['createdAt'] as int,
    updateAt: json['updateAt'] as int,
    id: json['id'] as String ?? '',
    pdfUrl: json['pdfUrl'] as String ?? '',
    createUserId: json['createUserId'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_PdfStateToJson(_$_PdfState instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'id': instance.id,
      'pdfUrl': instance.pdfUrl,
      'createUserId': instance.createUserId,
    };
