// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ImageEntity _$ImageEntityFromJson(Map<String, dynamic> json) {
  return _ImageEntity.fromJson(json);
}

class _$ImageEntityTearOff {
  const _$ImageEntityTearOff();

// ignore: unused_element
  _ImageEntity call(
      {String title,
      String image_id,
      String memo,
      String created_at,
      String updated_at,
      String originalUrl,
      String url,
      List<TagState> tags}) {
    return _ImageEntity(
      title: title,
      image_id: image_id,
      memo: memo,
      created_at: created_at,
      updated_at: updated_at,
      originalUrl: originalUrl,
      url: url,
      tags: tags,
    );
  }
}

// ignore: unused_element
const $ImageEntity = _$ImageEntityTearOff();

mixin _$ImageEntity {
  String get title;
  String get image_id;
  String get memo;
  String get created_at;
  String get updated_at;
  String get originalUrl;
  String get url;
  List<TagState> get tags;

  Map<String, dynamic> toJson();
  $ImageEntityCopyWith<ImageEntity> get copyWith;
}

abstract class $ImageEntityCopyWith<$Res> {
  factory $ImageEntityCopyWith(
          ImageEntity value, $Res Function(ImageEntity) then) =
      _$ImageEntityCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String image_id,
      String memo,
      String created_at,
      String updated_at,
      String originalUrl,
      String url,
      List<TagState> tags});
}

class _$ImageEntityCopyWithImpl<$Res> implements $ImageEntityCopyWith<$Res> {
  _$ImageEntityCopyWithImpl(this._value, this._then);

  final ImageEntity _value;
  // ignore: unused_field
  final $Res Function(ImageEntity) _then;

  @override
  $Res call({
    Object title = freezed,
    Object image_id = freezed,
    Object memo = freezed,
    Object created_at = freezed,
    Object updated_at = freezed,
    Object originalUrl = freezed,
    Object url = freezed,
    Object tags = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      image_id: image_id == freezed ? _value.image_id : image_id as String,
      memo: memo == freezed ? _value.memo : memo as String,
      created_at:
          created_at == freezed ? _value.created_at : created_at as String,
      updated_at:
          updated_at == freezed ? _value.updated_at : updated_at as String,
      originalUrl:
          originalUrl == freezed ? _value.originalUrl : originalUrl as String,
      url: url == freezed ? _value.url : url as String,
      tags: tags == freezed ? _value.tags : tags as List<TagState>,
    ));
  }
}

abstract class _$ImageEntityCopyWith<$Res>
    implements $ImageEntityCopyWith<$Res> {
  factory _$ImageEntityCopyWith(
          _ImageEntity value, $Res Function(_ImageEntity) then) =
      __$ImageEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String image_id,
      String memo,
      String created_at,
      String updated_at,
      String originalUrl,
      String url,
      List<TagState> tags});
}

class __$ImageEntityCopyWithImpl<$Res> extends _$ImageEntityCopyWithImpl<$Res>
    implements _$ImageEntityCopyWith<$Res> {
  __$ImageEntityCopyWithImpl(
      _ImageEntity _value, $Res Function(_ImageEntity) _then)
      : super(_value, (v) => _then(v as _ImageEntity));

  @override
  _ImageEntity get _value => super._value as _ImageEntity;

  @override
  $Res call({
    Object title = freezed,
    Object image_id = freezed,
    Object memo = freezed,
    Object created_at = freezed,
    Object updated_at = freezed,
    Object originalUrl = freezed,
    Object url = freezed,
    Object tags = freezed,
  }) {
    return _then(_ImageEntity(
      title: title == freezed ? _value.title : title as String,
      image_id: image_id == freezed ? _value.image_id : image_id as String,
      memo: memo == freezed ? _value.memo : memo as String,
      created_at:
          created_at == freezed ? _value.created_at : created_at as String,
      updated_at:
          updated_at == freezed ? _value.updated_at : updated_at as String,
      originalUrl:
          originalUrl == freezed ? _value.originalUrl : originalUrl as String,
      url: url == freezed ? _value.url : url as String,
      tags: tags == freezed ? _value.tags : tags as List<TagState>,
    ));
  }
}

@JsonSerializable()
class _$_ImageEntity implements _ImageEntity {
  const _$_ImageEntity(
      {this.title,
      this.image_id,
      this.memo,
      this.created_at,
      this.updated_at,
      this.originalUrl,
      this.url,
      this.tags});

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
  final List<TagState> tags;

  @override
  String toString() {
    return 'ImageEntity(title: $title, image_id: $image_id, memo: $memo, created_at: $created_at, updated_at: $updated_at, originalUrl: $originalUrl, url: $url, tags: $tags)';
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
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)));
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
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(tags);

  @override
  _$ImageEntityCopyWith<_ImageEntity> get copyWith =>
      __$ImageEntityCopyWithImpl<_ImageEntity>(this, _$identity);

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
      String url,
      List<TagState> tags}) = _$_ImageEntity;

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
  List<TagState> get tags;
  @override
  _$ImageEntityCopyWith<_ImageEntity> get copyWith;
}
