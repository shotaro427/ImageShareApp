import 'package:freezed_annotation/freezed_annotation.dart';
part 'image.entity.freezed.dart';
part 'image.entity.g.dart';

@freezed
abstract class ImageState with _$ImageState {
  const factory ImageState({
    int createdAt,
    int updateAt,
    @Default('') String id,
    @Default('') String imageUrl,
    @Default('') String createUserId,
  }) = _ImageState;

  factory ImageState.fromJson(Map<String, dynamic> json) =>
      _$ImageStateFromJson(json);
}
