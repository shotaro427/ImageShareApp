// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'image_upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ImageUploadState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(@required File file),
    @required Result success(@required File file),
    @required Result successUpload(@required File file),
    @required Result error(String message, @required File file),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(@required File file),
    Result success(@required File file),
    Result successUpload(@required File file),
    Result error(String message, @required File file),
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

class _$ImageUploadStateTearOff {
  const _$ImageUploadStateTearOff();

  _ImageUploadState call() {
    return const _ImageUploadState();
  }

  Loading loading({@required File file}) {
    return Loading(
      file: file,
    );
  }

  Success success({@required File file}) {
    return Success(
      file: file,
    );
  }

  SuccessUpload successUpload({@required File file}) {
    return SuccessUpload(
      file: file,
    );
  }

  ErrorDetails error({String message = '', @required File file}) {
    return ErrorDetails(
      message: message,
      file: file,
    );
  }
}

const $ImageUploadState = _$ImageUploadStateTearOff();

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
    @required Result loading(@required File file),
    @required Result success(@required File file),
    @required Result successUpload(@required File file),
    @required Result error(String message, @required File file),
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
    Result loading(@required File file),
    Result success(@required File file),
    Result successUpload(@required File file),
    Result error(String message, @required File file),
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
  _$Loading copyWith({
    Object file = freezed,
  }) {
    return _$Loading(
      file: file == freezed ? this.file : file as File,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(@required File file),
    @required Result success(@required File file),
    @required Result successUpload(@required File file),
    @required Result error(String message, @required File file),
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
    Result loading(@required File file),
    Result success(@required File file),
    Result successUpload(@required File file),
    Result error(String message, @required File file),
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

  Loading copyWith({File file});
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
  _$Success copyWith({
    Object file = freezed,
  }) {
    return _$Success(
      file: file == freezed ? this.file : file as File,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(@required File file),
    @required Result success(@required File file),
    @required Result successUpload(@required File file),
    @required Result error(String message, @required File file),
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
    Result loading(@required File file),
    Result success(@required File file),
    Result successUpload(@required File file),
    Result error(String message, @required File file),
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

  Success copyWith({File file});
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
  _$SuccessUpload copyWith({
    Object file = freezed,
  }) {
    return _$SuccessUpload(
      file: file == freezed ? this.file : file as File,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(@required File file),
    @required Result success(@required File file),
    @required Result successUpload(@required File file),
    @required Result error(String message, @required File file),
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
    Result loading(@required File file),
    Result success(@required File file),
    Result successUpload(@required File file),
    Result error(String message, @required File file),
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

  SuccessUpload copyWith({File file});
}

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails({this.message = '', @required this.file})
      : assert(file != null);

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
  _$ErrorDetails copyWith({
    Object message = freezed,
    Object file = freezed,
  }) {
    return _$ErrorDetails(
      message: message == freezed ? this.message : message as String,
      file: file == freezed ? this.file : file as File,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(@required File file),
    @required Result success(@required File file),
    @required Result successUpload(@required File file),
    @required Result error(String message, @required File file),
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
    Result loading(@required File file),
    Result success(@required File file),
    Result successUpload(@required File file),
    Result error(String message, @required File file),
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

  ErrorDetails copyWith({String message, File file});
}
