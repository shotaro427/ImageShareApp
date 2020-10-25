// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'create_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CreatePostStateTearOff {
  const _$CreatePostStateTearOff();

// ignore: unused_element
  _CreatePostState call(
      {bool isLoading = false,
      String error,
      List<File> pickedFiles,
      String title = '',
      String memo = '',
      List<String> tags = const [],
      bool isInputTag = false}) {
    return _CreatePostState(
      isLoading: isLoading,
      error: error,
      pickedFiles: pickedFiles,
      title: title,
      memo: memo,
      tags: tags,
      isInputTag: isInputTag,
    );
  }
}

// ignore: unused_element
const $CreatePostState = _$CreatePostStateTearOff();

mixin _$CreatePostState {
  bool get isLoading;
  String get error;
  List<File> get pickedFiles;
  String get title;
  String get memo;
  List<String> get tags;
  bool get isInputTag;

  $CreatePostStateCopyWith<CreatePostState> get copyWith;
}

abstract class $CreatePostStateCopyWith<$Res> {
  factory $CreatePostStateCopyWith(
          CreatePostState value, $Res Function(CreatePostState) then) =
      _$CreatePostStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String error,
      List<File> pickedFiles,
      String title,
      String memo,
      List<String> tags,
      bool isInputTag});
}

class _$CreatePostStateCopyWithImpl<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  _$CreatePostStateCopyWithImpl(this._value, this._then);

  final CreatePostState _value;
  // ignore: unused_field
  final $Res Function(CreatePostState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
    Object pickedFiles = freezed,
    Object title = freezed,
    Object memo = freezed,
    Object tags = freezed,
    Object isInputTag = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
      pickedFiles: pickedFiles == freezed
          ? _value.pickedFiles
          : pickedFiles as List<File>,
      title: title == freezed ? _value.title : title as String,
      memo: memo == freezed ? _value.memo : memo as String,
      tags: tags == freezed ? _value.tags : tags as List<String>,
      isInputTag:
          isInputTag == freezed ? _value.isInputTag : isInputTag as bool,
    ));
  }
}

abstract class _$CreatePostStateCopyWith<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  factory _$CreatePostStateCopyWith(
          _CreatePostState value, $Res Function(_CreatePostState) then) =
      __$CreatePostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      String error,
      List<File> pickedFiles,
      String title,
      String memo,
      List<String> tags,
      bool isInputTag});
}

class __$CreatePostStateCopyWithImpl<$Res>
    extends _$CreatePostStateCopyWithImpl<$Res>
    implements _$CreatePostStateCopyWith<$Res> {
  __$CreatePostStateCopyWithImpl(
      _CreatePostState _value, $Res Function(_CreatePostState) _then)
      : super(_value, (v) => _then(v as _CreatePostState));

  @override
  _CreatePostState get _value => super._value as _CreatePostState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object error = freezed,
    Object pickedFiles = freezed,
    Object title = freezed,
    Object memo = freezed,
    Object tags = freezed,
    Object isInputTag = freezed,
  }) {
    return _then(_CreatePostState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      error: error == freezed ? _value.error : error as String,
      pickedFiles: pickedFiles == freezed
          ? _value.pickedFiles
          : pickedFiles as List<File>,
      title: title == freezed ? _value.title : title as String,
      memo: memo == freezed ? _value.memo : memo as String,
      tags: tags == freezed ? _value.tags : tags as List<String>,
      isInputTag:
          isInputTag == freezed ? _value.isInputTag : isInputTag as bool,
    ));
  }
}

class _$_CreatePostState implements _CreatePostState {
  const _$_CreatePostState(
      {this.isLoading = false,
      this.error,
      this.pickedFiles,
      this.title = '',
      this.memo = '',
      this.tags = const [],
      this.isInputTag = false})
      : assert(isLoading != null),
        assert(title != null),
        assert(memo != null),
        assert(tags != null),
        assert(isInputTag != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final List<File> pickedFiles;
  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String memo;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> tags;
  @JsonKey(defaultValue: false)
  @override
  final bool isInputTag;

  @override
  String toString() {
    return 'CreatePostState(isLoading: $isLoading, error: $error, pickedFiles: $pickedFiles, title: $title, memo: $memo, tags: $tags, isInputTag: $isInputTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CreatePostState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.pickedFiles, pickedFiles) ||
                const DeepCollectionEquality()
                    .equals(other.pickedFiles, pickedFiles)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.isInputTag, isInputTag) ||
                const DeepCollectionEquality()
                    .equals(other.isInputTag, isInputTag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(pickedFiles) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(isInputTag);

  @override
  _$CreatePostStateCopyWith<_CreatePostState> get copyWith =>
      __$CreatePostStateCopyWithImpl<_CreatePostState>(this, _$identity);
}

abstract class _CreatePostState implements CreatePostState {
  const factory _CreatePostState(
      {bool isLoading,
      String error,
      List<File> pickedFiles,
      String title,
      String memo,
      List<String> tags,
      bool isInputTag}) = _$_CreatePostState;

  @override
  bool get isLoading;
  @override
  String get error;
  @override
  List<File> get pickedFiles;
  @override
  String get title;
  @override
  String get memo;
  @override
  List<String> get tags;
  @override
  bool get isInputTag;
  @override
  _$CreatePostStateCopyWith<_CreatePostState> get copyWith;
}
