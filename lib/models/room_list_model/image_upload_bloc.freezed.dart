// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image_upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ImageUploadStateTearOff {
  const _$ImageUploadStateTearOff();

// ignore: unused_element
  _ImageUploadState call() {
    return const _ImageUploadState();
  }

// ignore: unused_element
  Loading loading({@required File file}) {
    return Loading(
      file: file,
    );
  }

// ignore: unused_element
  Success success({@required File file}) {
    return Success(
      file: file,
    );
  }

// ignore: unused_element
  SuccessUpload successUpload({@required File file}) {
    return SuccessUpload(
      file: file,
    );
  }

// ignore: unused_element
  ErrorDetails error({String message = '', @required File file}) {
    return ErrorDetails(
      message: message,
      file: file,
    );
  }
}

// ignore: unused_element
const $ImageUploadState = _$ImageUploadStateTearOff();

mixin _$ImageUploadState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(File file),
    @required Result success(File file),
    @required Result successUpload(File file),
    @required Result error(String message, File file),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(File file),
    Result success(File file),
    Result successUpload(File file),
    Result error(String message, File file),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageUploadState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result successUpload(SuccessUpload value),
    @required Result error(ErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageUploadState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result successUpload(SuccessUpload value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  });
}

abstract class $ImageUploadStateCopyWith<$Res> {
  factory $ImageUploadStateCopyWith(
          ImageUploadState value, $Res Function(ImageUploadState) then) =
      _$ImageUploadStateCopyWithImpl<$Res>;
}

class _$ImageUploadStateCopyWithImpl<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  _$ImageUploadStateCopyWithImpl(this._value, this._then);

  final ImageUploadState _value;
  // ignore: unused_field
  final $Res Function(ImageUploadState) _then;
}

abstract class _$ImageUploadStateCopyWith<$Res> {
  factory _$ImageUploadStateCopyWith(
          _ImageUploadState value, $Res Function(_ImageUploadState) then) =
      __$ImageUploadStateCopyWithImpl<$Res>;
}

class __$ImageUploadStateCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res>
    implements _$ImageUploadStateCopyWith<$Res> {
  __$ImageUploadStateCopyWithImpl(
      _ImageUploadState _value, $Res Function(_ImageUploadState) _then)
      : super(_value, (v) => _then(v as _ImageUploadState));

  @override
  _ImageUploadState get _value => super._value as _ImageUploadState;
}

class _$_ImageUploadState
    with DiagnosticableTreeMixin
    implements _ImageUploadState {
  const _$_ImageUploadState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageUploadState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ImageUploadState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ImageUploadState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(File file),
    @required Result success(File file),
    @required Result successUpload(File file),
    @required Result error(String message, File file),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return $default();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(File file),
    Result success(File file),
    Result successUpload(File file),
    Result error(String message, File file),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageUploadState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result successUpload(SuccessUpload value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageUploadState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result successUpload(SuccessUpload value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ImageUploadState implements ImageUploadState {
  const factory _ImageUploadState() = _$_ImageUploadState;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
  $Res call({File file});
}

class _$LoadingCopyWithImpl<$Res> extends _$ImageUploadStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;

  @override
  $Res call({
    Object file = freezed,
  }) {
    return _then(Loading(
      file: file == freezed ? _value.file : file as File,
    ));
  }
}

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading({@required this.file}) : assert(file != null);

  @override
  final File file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageUploadState.loading(file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageUploadState.loading'))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loading &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @override
  $LoadingCopyWith<Loading> get copyWith =>
      _$LoadingCopyWithImpl<Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(File file),
    @required Result success(File file),
    @required Result successUpload(File file),
    @required Result error(String message, File file),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return loading(file);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(File file),
    Result success(File file),
    Result successUpload(File file),
    Result error(String message, File file),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageUploadState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result successUpload(SuccessUpload value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageUploadState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result successUpload(SuccessUpload value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ImageUploadState {
  const factory Loading({@required File file}) = _$Loading;

  File get file;
  $LoadingCopyWith<Loading> get copyWith;
}

abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({File file});
}

class _$SuccessCopyWithImpl<$Res> extends _$ImageUploadStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object file = freezed,
  }) {
    return _then(Success(
      file: file == freezed ? _value.file : file as File,
    ));
  }
}

class _$Success with DiagnosticableTreeMixin implements Success {
  const _$Success({@required this.file}) : assert(file != null);

  @override
  final File file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageUploadState.success(file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageUploadState.success'))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(File file),
    @required Result success(File file),
    @required Result successUpload(File file),
    @required Result error(String message, File file),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return success(file);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(File file),
    Result success(File file),
    Result successUpload(File file),
    Result error(String message, File file),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageUploadState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result successUpload(SuccessUpload value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageUploadState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result successUpload(SuccessUpload value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements ImageUploadState {
  const factory Success({@required File file}) = _$Success;

  File get file;
  $SuccessCopyWith<Success> get copyWith;
}

abstract class $SuccessUploadCopyWith<$Res> {
  factory $SuccessUploadCopyWith(
          SuccessUpload value, $Res Function(SuccessUpload) then) =
      _$SuccessUploadCopyWithImpl<$Res>;
  $Res call({File file});
}

class _$SuccessUploadCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res>
    implements $SuccessUploadCopyWith<$Res> {
  _$SuccessUploadCopyWithImpl(
      SuccessUpload _value, $Res Function(SuccessUpload) _then)
      : super(_value, (v) => _then(v as SuccessUpload));

  @override
  SuccessUpload get _value => super._value as SuccessUpload;

  @override
  $Res call({
    Object file = freezed,
  }) {
    return _then(SuccessUpload(
      file: file == freezed ? _value.file : file as File,
    ));
  }
}

class _$SuccessUpload with DiagnosticableTreeMixin implements SuccessUpload {
  const _$SuccessUpload({@required this.file}) : assert(file != null);

  @override
  final File file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageUploadState.successUpload(file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageUploadState.successUpload'))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SuccessUpload &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(file);

  @override
  $SuccessUploadCopyWith<SuccessUpload> get copyWith =>
      _$SuccessUploadCopyWithImpl<SuccessUpload>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(File file),
    @required Result success(File file),
    @required Result successUpload(File file),
    @required Result error(String message, File file),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return successUpload(file);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(File file),
    Result success(File file),
    Result successUpload(File file),
    Result error(String message, File file),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successUpload != null) {
      return successUpload(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageUploadState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result successUpload(SuccessUpload value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return successUpload(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageUploadState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result successUpload(SuccessUpload value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (successUpload != null) {
      return successUpload(this);
    }
    return orElse();
  }
}

abstract class SuccessUpload implements ImageUploadState {
  const factory SuccessUpload({@required File file}) = _$SuccessUpload;

  File get file;
  $SuccessUploadCopyWith<SuccessUpload> get copyWith;
}

abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message, File file});
}

class _$ErrorDetailsCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails _value, $Res Function(ErrorDetails) _then)
      : super(_value, (v) => _then(v as ErrorDetails));

  @override
  ErrorDetails get _value => super._value as ErrorDetails;

  @override
  $Res call({
    Object message = freezed,
    Object file = freezed,
  }) {
    return _then(ErrorDetails(
      message: message == freezed ? _value.message : message as String,
      file: file == freezed ? _value.file : file as File,
    ));
  }
}

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails({this.message = '', @required this.file})
      : assert(message != null),
        assert(file != null);

  @JsonKey(defaultValue: '')
  @override
  final String message;
  @override
  final File file;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageUploadState.error(message: $message, file: $file)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageUploadState.error'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('file', file));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(file);

  @override
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      _$ErrorDetailsCopyWithImpl<ErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(File file),
    @required Result success(File file),
    @required Result successUpload(File file),
    @required Result error(String message, File file),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return error(message, file);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(File file),
    Result success(File file),
    Result successUpload(File file),
    Result error(String message, File file),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message, file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageUploadState value), {
    @required Result loading(Loading value),
    @required Result success(Success value),
    @required Result successUpload(SuccessUpload value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(success != null);
    assert(successUpload != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageUploadState value), {
    Result loading(Loading value),
    Result success(Success value),
    Result successUpload(SuccessUpload value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements ImageUploadState {
  const factory ErrorDetails({String message, @required File file}) =
      _$ErrorDetails;

  String get message;
  File get file;
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith;
}
