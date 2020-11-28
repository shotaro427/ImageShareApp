// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'post_top_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PostTopState _$PostTopStateFromJson(Map<String, dynamic> json) {
  return _PostTopState.fromJson(json);
}

class _$PostTopStateTearOff {
  const _$PostTopStateTearOff();

// ignore: unused_element
  _PostTopState call(
      {bool isLoading = false,
      String error,
      List<PostState> posts,
      bool canPost}) {
    return _PostTopState(
      isLoading: isLoading,
      error: error,
      posts: posts,
      canPost: canPost,
    );
  }
}

// ignore: unused_element
const $PostTopState = _$PostTopStateTearOff();

mixin _$PostTopState {
  bool get isLoading;
  String get error;
  List<PostState> get posts;
  bool get canPost;

  Map<String, dynamic> toJson();
  $PostTopStateCopyWith<PostTopState> get copyWith;
}

abstract class $PostTopStateCopyWith<$Res> {
  factory $PostTopStateCopyWith(
          PostTopState value, $Res Function(PostTopState) then) =
      _$PostTopStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, String error, List<PostState> posts, bool canPost});
}

class _$PostTopStateCopyWithImpl<$Res> implements $PostTopStateCopyWith<$Res> {
  _$PostTopStateCopyWithImpl(this._value, this._then);

  final PostTopState _value;
  // ignore: unused_field
  final $Res Function(PostTopState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
    Object posts = freezed,
    Object canPost = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
      posts: posts == freezed ? _value.posts : posts as List<PostState>,
      canPost: canPost == freezed ? _value.canPost : canPost as bool,
    ));
  }
}

abstract class _$PostTopStateCopyWith<$Res>
    implements $PostTopStateCopyWith<$Res> {
  factory _$PostTopStateCopyWith(
          _PostTopState value, $Res Function(_PostTopState) then) =
      __$PostTopStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, String error, List<PostState> posts, bool canPost});
}

class __$PostTopStateCopyWithImpl<$Res> extends _$PostTopStateCopyWithImpl<$Res>
    implements _$PostTopStateCopyWith<$Res> {
  __$PostTopStateCopyWithImpl(
      _PostTopState _value, $Res Function(_PostTopState) _then)
      : super(_value, (v) => _then(v as _PostTopState));

  @override
  _PostTopState get _value => super._value as _PostTopState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
    Object posts = freezed,
    Object canPost = freezed,
  }) {
    return _then(_PostTopState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
      posts: posts == freezed ? _value.posts : posts as List<PostState>,
      canPost: canPost == freezed ? _value.canPost : canPost as bool,
    ));
  }
}

@JsonSerializable()
class _$_PostTopState implements _PostTopState {
  const _$_PostTopState(
      {this.isLoading = false, this.error, this.posts, this.canPost})
      : assert(isLoading != null);

  factory _$_PostTopState.fromJson(Map<String, dynamic> json) =>
      _$_$_PostTopStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final List<PostState> posts;
  @override
  final bool canPost;

  @override
  String toString() {
    return 'PostTopState(isLoading: $isLoading, error: $error, posts: $posts, canPost: $canPost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostTopState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.canPost, canPost) ||
                const DeepCollectionEquality().equals(other.canPost, canPost)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(canPost);

  @override
  _$PostTopStateCopyWith<_PostTopState> get copyWith =>
      __$PostTopStateCopyWithImpl<_PostTopState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostTopStateToJson(this);
  }
}

abstract class _PostTopState implements PostTopState {
  const factory _PostTopState(
      {bool isLoading,
      String error,
      List<PostState> posts,
      bool canPost}) = _$_PostTopState;

  factory _PostTopState.fromJson(Map<String, dynamic> json) =
      _$_PostTopState.fromJson;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  List<PostState> get posts;
  @override
  bool get canPost;
  @override
  _$PostTopStateCopyWith<_PostTopState> get copyWith;
}
