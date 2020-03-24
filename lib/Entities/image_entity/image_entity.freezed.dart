// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

ImageEntity _$ImageEntityFromJson(Map<String, dynamic> json) {
  return _ImageEntity.fromJson(json);
}

mixin _$ImageEntity {
  String get title;
  String get image_id;
  String get memo;
  String get created_at;
  String get updated_at;
  String get originalUrl;
  String get url;

  ImageEntity copyWith(
      {String title,
      String image_id,
      String memo,
      String created_at,
      String updated_at,
      String originalUrl,
      String url});

  Map<String, dynamic> toJson();
}

class _$ImageEntityTearOff {
  const _$ImageEntityTearOff();

  _ImageEntity call(
      {String title,
      String image_id,
      String memo,
      String created_at,
      String updated_at,
      String originalUrl,
      String url}) {
    return _ImageEntity(
      title: title,
      image_id: image_id,
      memo: memo,
      created_at: created_at,
      updated_at: updated_at,
      originalUrl: originalUrl,
      url: url,
    );
  }
}

const $ImageEntity = _$ImageEntityTearOff();

@JsonSerializable()
class _$_ImageEntity implements _ImageEntity {
  const _$_ImageEntity(
      {this.title,
      this.image_id,
      this.memo,
      this.created_at,
      this.updated_at,
      this.originalUrl,
      this.url});

  factory _$_ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageEntityFromJson(json);

  @override
  final String title;
  @override
  final String image_id;
  @override
  final String memo;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final String originalUrl;
  @override
  final String url;

  @override
  String toString() {
    return 'ImageEntity(title: $title, image_id: $image_id, memo: $memo, created_at: $created_at, updated_at: $updated_at, originalUrl: $originalUrl, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageEntity &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.image_id, image_id) ||
                const DeepCollectionEquality()
                    .equals(other.image_id, image_id)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.created_at, created_at) ||
                const DeepCollectionEquality()
                    .equals(other.created_at, created_at)) &&
            (identical(other.updated_at, updated_at) ||
                const DeepCollectionEquality()
                    .equals(other.updated_at, updated_at)) &&
            (identical(other.originalUrl, originalUrl) ||
                const DeepCollectionEquality()
                    .equals(other.originalUrl, originalUrl)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(image_id) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(created_at) ^
      const DeepCollectionEquality().hash(updated_at) ^
      const DeepCollectionEquality().hash(originalUrl) ^
      const DeepCollectionEquality().hash(url);

  @override
  _$_ImageEntity copyWith({
    Object title = freezed,
    Object image_id = freezed,
    Object memo = freezed,
    Object created_at = freezed,
    Object updated_at = freezed,
    Object originalUrl = freezed,
    Object url = freezed,
  }) {
    return _$_ImageEntity(
      title: title == freezed ? this.title : title as String,
      image_id: image_id == freezed ? this.image_id : image_id as String,
      memo: memo == freezed ? this.memo : memo as String,
      created_at:
          created_at == freezed ? this.created_at : created_at as String,
      updated_at:
          updated_at == freezed ? this.updated_at : updated_at as String,
      originalUrl:
          originalUrl == freezed ? this.originalUrl : originalUrl as String,
      url: url == freezed ? this.url : url as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageEntityToJson(this);
  }
}

abstract class _ImageEntity implements ImageEntity {
  const factory _ImageEntity(
      {String title,
      String image_id,
      String memo,
      String created_at,
      String updated_at,
      String originalUrl,
      String url}) = _$_ImageEntity;

  factory _ImageEntity.fromJson(Map<String, dynamic> json) =
      _$_ImageEntity.fromJson;

  @override
  String get title;
  @override
  String get image_id;
  @override
  String get memo;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  String get originalUrl;
  @override
  String get url;

  @override
  _ImageEntity copyWith(
      {String title,
      String image_id,
      String memo,
      String created_at,
      String updated_at,
      String originalUrl,
      String url});
}
