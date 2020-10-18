// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'post.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PostState _$PostStateFromJson(Map<String, dynamic> json) {
  return _PostState.fromJson(json);
}

class _$PostStateTearOff {
  const _$PostStateTearOff();

// ignore: unused_element
  _PostState call(
      {int createdAt,
      int updateAt,
      String id = '',
      String title = '',
      String description = '',
      List<String> tags = const [],
      String createUserId = '',
      String thumbnailUrl = '',
      Map<String, String> bgramMap = const {}}) {
    return _PostState(
      createdAt: createdAt,
      updateAt: updateAt,
      id: id,
      title: title,
      description: description,
      tags: tags,
      createUserId: createUserId,
      thumbnailUrl: thumbnailUrl,
      bgramMap: bgramMap,
    );
  }
}

// ignore: unused_element
const $PostState = _$PostStateTearOff();

mixin _$PostState {
  int get createdAt;
  int get updateAt;
  String get id;
  String get title;
  String get description;
  List<String> get tags;
  String get createUserId;
  String get thumbnailUrl;
  Map<String, String> get bgramMap;

  Map<String, dynamic> toJson();
  $PostStateCopyWith<PostState> get copyWith;
}

abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res>;
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String title,
      String description,
      List<String> tags,
      String createUserId,
      String thumbnailUrl,
      Map<String, String> bgramMap});
}

class _$PostStateCopyWithImpl<$Res> implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  final PostState _value;
  // ignore: unused_field
  final $Res Function(PostState) _then;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object title = freezed,
    Object description = freezed,
    Object tags = freezed,
    Object createUserId = freezed,
    Object thumbnailUrl = freezed,
    Object bgramMap = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      tags: tags == freezed ? _value.tags : tags as List<String>,
      createUserId: createUserId == freezed
          ? _value.createUserId
          : createUserId as String,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl as String,
      bgramMap: bgramMap == freezed
          ? _value.bgramMap
          : bgramMap as Map<String, String>,
    ));
  }
}

abstract class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(
          _PostState value, $Res Function(_PostState) then) =
      __$PostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int createdAt,
      int updateAt,
      String id,
      String title,
      String description,
      List<String> tags,
      String createUserId,
      String thumbnailUrl,
      Map<String, String> bgramMap});
}

class __$PostStateCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(_PostState _value, $Res Function(_PostState) _then)
      : super(_value, (v) => _then(v as _PostState));

  @override
  _PostState get _value => super._value as _PostState;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updateAt = freezed,
    Object id = freezed,
    Object title = freezed,
    Object description = freezed,
    Object tags = freezed,
    Object createUserId = freezed,
    Object thumbnailUrl = freezed,
    Object bgramMap = freezed,
  }) {
    return _then(_PostState(
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as int,
      updateAt: updateAt == freezed ? _value.updateAt : updateAt as int,
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      tags: tags == freezed ? _value.tags : tags as List<String>,
      createUserId: createUserId == freezed
          ? _value.createUserId
          : createUserId as String,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl as String,
      bgramMap: bgramMap == freezed
          ? _value.bgramMap
          : bgramMap as Map<String, String>,
    ));
  }
}

@JsonSerializable()
class _$_PostState implements _PostState {
  const _$_PostState(
      {this.createdAt,
      this.updateAt,
      this.id = '',
      this.title = '',
      this.description = '',
      this.tags = const [],
      this.createUserId = '',
      this.thumbnailUrl = '',
      this.bgramMap = const {}})
      : assert(id != null),
        assert(title != null),
        assert(description != null),
        assert(tags != null),
        assert(createUserId != null),
        assert(thumbnailUrl != null),
        assert(bgramMap != null);

  factory _$_PostState.fromJson(Map<String, dynamic> json) =>
      _$_$_PostStateFromJson(json);

  @override
  final int createdAt;
  @override
  final int updateAt;
  @JsonKey(defaultValue: '')
  @override
  final String id;
  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String description;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> tags;
  @JsonKey(defaultValue: '')
  @override
  final String createUserId;
  @JsonKey(defaultValue: '')
  @override
  final String thumbnailUrl;
  @JsonKey(defaultValue: const {})
  @override
  final Map<String, String> bgramMap;

  @override
  String toString() {
    return 'PostState(createdAt: $createdAt, updateAt: $updateAt, id: $id, title: $title, description: $description, tags: $tags, createUserId: $createUserId, thumbnailUrl: $thumbnailUrl, bgramMap: $bgramMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostState &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updateAt, updateAt) ||
                const DeepCollectionEquality()
                    .equals(other.updateAt, updateAt)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.createUserId, createUserId) ||
                const DeepCollectionEquality()
                    .equals(other.createUserId, createUserId)) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnailUrl, thumbnailUrl)) &&
            (identical(other.bgramMap, bgramMap) ||
                const DeepCollectionEquality()
                    .equals(other.bgramMap, bgramMap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updateAt) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(createUserId) ^
      const DeepCollectionEquality().hash(thumbnailUrl) ^
      const DeepCollectionEquality().hash(bgramMap);

  @override
  _$PostStateCopyWith<_PostState> get copyWith =>
      __$PostStateCopyWithImpl<_PostState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostStateToJson(this);
  }
}

abstract class _PostState implements PostState {
  const factory _PostState(
      {int createdAt,
      int updateAt,
      String id,
      String title,
      String description,
      List<String> tags,
      String createUserId,
      String thumbnailUrl,
      Map<String, String> bgramMap}) = _$_PostState;

  factory _PostState.fromJson(Map<String, dynamic> json) =
      _$_PostState.fromJson;

  @override
  int get createdAt;
  @override
  int get updateAt;
  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get tags;
  @override
  String get createUserId;
  @override
  String get thumbnailUrl;
  @override
  Map<String, String> get bgramMap;
  @override
  _$PostStateCopyWith<_PostState> get copyWith;
}
