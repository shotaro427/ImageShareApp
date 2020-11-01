// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'post_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PostDetailState _$PostDetailStateFromJson(Map<String, dynamic> json) {
  return _PostDetailState.fromJson(json);
}

class _$PostDetailStateTearOff {
  const _$PostDetailStateTearOff();

// ignore: unused_element
  _PostDetailState call(
      {String error, bool isLoading = false, int currentIndex = 0}) {
    return _PostDetailState(
      error: error,
      isLoading: isLoading,
      currentIndex: currentIndex,
    );
  }
}

// ignore: unused_element
const $PostDetailState = _$PostDetailStateTearOff();

mixin _$PostDetailState {
  String get error;
  bool get isLoading;
  int get currentIndex;

  Map<String, dynamic> toJson();
  $PostDetailStateCopyWith<PostDetailState> get copyWith;
}

abstract class $PostDetailStateCopyWith<$Res> {
  factory $PostDetailStateCopyWith(
          PostDetailState value, $Res Function(PostDetailState) then) =
      _$PostDetailStateCopyWithImpl<$Res>;
  $Res call({String error, bool isLoading, int currentIndex});
}

class _$PostDetailStateCopyWithImpl<$Res>
    implements $PostDetailStateCopyWith<$Res> {
  _$PostDetailStateCopyWithImpl(this._value, this._then);

  final PostDetailState _value;
  // ignore: unused_field
  final $Res Function(PostDetailState) _then;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
    Object currentIndex = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      currentIndex:
          currentIndex == freezed ? _value.currentIndex : currentIndex as int,
    ));
  }
}

abstract class _$PostDetailStateCopyWith<$Res>
    implements $PostDetailStateCopyWith<$Res> {
  factory _$PostDetailStateCopyWith(
          _PostDetailState value, $Res Function(_PostDetailState) then) =
      __$PostDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({String error, bool isLoading, int currentIndex});
}

class __$PostDetailStateCopyWithImpl<$Res>
    extends _$PostDetailStateCopyWithImpl<$Res>
    implements _$PostDetailStateCopyWith<$Res> {
  __$PostDetailStateCopyWithImpl(
      _PostDetailState _value, $Res Function(_PostDetailState) _then)
      : super(_value, (v) => _then(v as _PostDetailState));

  @override
  _PostDetailState get _value => super._value as _PostDetailState;

  @override
  $Res call({
    Object error = freezed,
    Object isLoading = freezed,
    Object currentIndex = freezed,
  }) {
    return _then(_PostDetailState(
      error: error == freezed ? _value.error : error as String,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      currentIndex:
          currentIndex == freezed ? _value.currentIndex : currentIndex as int,
    ));
  }
}

@JsonSerializable()
class _$_PostDetailState implements _PostDetailState {
  const _$_PostDetailState(
      {this.error, this.isLoading = false, this.currentIndex = 0})
      : assert(isLoading != null),
        assert(currentIndex != null);

  factory _$_PostDetailState.fromJson(Map<String, dynamic> json) =>
      _$_$_PostDetailStateFromJson(json);

  @override
  final String error;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: 0)
  @override
  final int currentIndex;

  @override
  String toString() {
    return 'PostDetailState(error: $error, isLoading: $isLoading, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostDetailState &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.currentIndex, currentIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentIndex, currentIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(currentIndex);

  @override
  _$PostDetailStateCopyWith<_PostDetailState> get copyWith =>
      __$PostDetailStateCopyWithImpl<_PostDetailState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostDetailStateToJson(this);
  }
}

abstract class _PostDetailState implements PostDetailState {
  const factory _PostDetailState(
      {String error, bool isLoading, int currentIndex}) = _$_PostDetailState;

  factory _PostDetailState.fromJson(Map<String, dynamic> json) =
      _$_PostDetailState.fromJson;

  @override
  String get error;
  @override
  bool get isLoading;
  @override
  int get currentIndex;
  @override
  _$PostDetailStateCopyWith<_PostDetailState> get copyWith;
}
