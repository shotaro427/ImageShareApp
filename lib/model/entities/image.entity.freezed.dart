// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ImageState _$ImageStateFromJson(Map<String, dynamic> json) {
  return _ImageState.fromJson(json);
}

class _$ImageStateTearOff {
  const _$ImageStateTearOff();

// ignore: unused_element
  _ImageState call(
      {int createdAt,
      int updateAt,
      String id = '',
      String imageUrl = '',
      String createUserId = ''}) {
    return _ImageState(
      createdAt: createdAt,
      updateAt: updateAt,
      id: id,
      imageUrl: imageUrl,
      createUserId: createUserId,
    );
  }
}

// ignore: unused_element
const $ImageState = _$ImageStateTearOff();

mixin _$ImageState {
  int get createdAt;
  int get updateAt;
  String get id;
  String get imageUrl;
  String get createUserId;

  Map<String, dynamic> toJson();
  $ImageStateCopyWith<ImageState> get copyWith;
}

abstract class $ImageStateCopyWith<$Res> {
  factory $ImageStateCopyWith(
          ImageState value, $Res Function(ImageState) then) =
      _$ImageStateCopyWithImpl<$Res>;
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String imageUrl,
      String createUserId});
}

class _$ImageStateCopyWithImpl<$Res> implements $ImageStateCopyWith<$Res> {
  _$ImageStateCopyWithImpl(this._value, this._then);

  final ImageState _value;
  // ignore: unused_field
  final $Res Function(ImageState) _then;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object imageUrl = freezed,
    Object createUserId = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      createUserId: createUserId == freezed
          ? _value.createUserId
          : createUserId as String,
    ));
  }
}

abstract class _$ImageStateCopyWith<$Res> implements $ImageStateCopyWith<$Res> {
  factory _$ImageStateCopyWith(
          _ImageState value, $Res Function(_ImageState) then) =
      __$ImageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String imageUrl,
      String createUserId});
}

class __$ImageStateCopyWithImpl<$Res> extends _$ImageStateCopyWithImpl<$Res>
    implements _$ImageStateCopyWith<$Res> {
  __$ImageStateCopyWithImpl(
      _ImageState _value, $Res Function(_ImageState) _then)
      : super(_value, (v) => _then(v as _ImageState));

  @override
  _ImageState get _value => super._value as _ImageState;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object imageUrl = freezed,
    Object createUserId = freezed,
  }) {
    return _then(_ImageState(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      createUserId: createUserId == freezed
          ? _value.createUserId
          : createUserId as String,
    ));
  }
}

@JsonSerializable()
class _$_ImageState implements _ImageState {
  const _$_ImageState(
      {this.createdAt,
      this.updateAt,
      this.id = '',
      this.imageUrl = '',
      this.createUserId = ''})
      : assert(id != null),
        assert(imageUrl != null),
        assert(createUserId != null);

  factory _$_ImageState.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageStateFromJson(json);

  @override
  final int createdAt;
  @override
  final int updateAt;
  @JsonKey(defaultValue: '')
  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String imageUrl;
  @JsonKey(defaultValue: '')
  @override
  final String createUserId;

  @override
  String toString() {
    return 'ImageState(createdAt: $createdAt, updateAt: $updateAt, id: $id, imageUrl: $imageUrl, createUserId: $createUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageState &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updateAt, updateAt) ||
                const DeepCollectionEquality()
                    .equals(other.updateAt, updateAt)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.createUserId, createUserId) ||
                const DeepCollectionEquality()
                    .equals(other.createUserId, createUserId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updateAt) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(createUserId);

  @override
  _$ImageStateCopyWith<_ImageState> get copyWith =>
      __$ImageStateCopyWithImpl<_ImageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageStateToJson(this);
  }
}

abstract class _ImageState implements ImageState {
  const factory _ImageState(
      {int createdAt,
      int updateAt,
      String id,
      String imageUrl,
      String createUserId}) = _$_ImageState;

  factory _ImageState.fromJson(Map<String, dynamic> json) =
      _$_ImageState.fromJson;

  @override
  int get createdAt;
  @override
  int get updateAt;
  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get createUserId;
  @override
  _$ImageStateCopyWith<_ImageState> get copyWith;
}
