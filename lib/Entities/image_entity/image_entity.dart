import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_entity.freezed.dart';
part 'image_entity.g.dart';

@freezed
abstract class ImageEntity with _$ImageEntity {
  const factory ImageEntity(
      {String title,
      String image_id,
      String memo,
      String created_at,
      String updated_at,
      String originalUrl,
      String url}) = _ImageEntity;

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);
}
