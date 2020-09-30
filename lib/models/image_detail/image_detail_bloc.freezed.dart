// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ImageDetailStateTearOff {
  const _$ImageDetailStateTearOff();

// ignore: unused_element
  _ImageDetailState call() {
    return const _ImageDetailState();
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Success viewing({@required ImageEntity imageEntity}) {
    return Success(
      imageEntity: imageEntity,
    );
  }

// ignore: unused_element
  Editing editing({@required ImageEntity imageEntity}) {
    return Editing(
      imageEntity: imageEntity,
    );
  }

// ignore: unused_element
  Deleted delete() {
    return const Deleted();
  }

// ignore: unused_element
  ErrorDetails error({String message = ''}) {
    return ErrorDetails(
      message: message,
    );
  }
}

// ignore: unused_element
const $ImageDetailState = _$ImageDetailStateTearOff();

mixin _$ImageDetailState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(ImageEntity imageEntity),
    @required Result editing(ImageEntity imageEntity),
    @required Result delete(),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result viewing(ImageEntity imageEntity),
    Result editing(ImageEntity imageEntity),
    Result delete(),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageDetailState value), {
    @required Result loading(Loading value),
    @required Result viewing(Success value),
    @required Result editing(Editing value),
    @required Result delete(Deleted value),
    @required Result error(ErrorDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageDetailState value), {
    Result loading(Loading value),
    Result viewing(Success value),
    Result editing(Editing value),
    Result delete(Deleted value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  });
}

abstract class $ImageDetailStateCopyWith<$Res> {
  factory $ImageDetailStateCopyWith(
          ImageDetailState value, $Res Function(ImageDetailState) then) =
      _$ImageDetailStateCopyWithImpl<$Res>;
}

class _$ImageDetailStateCopyWithImpl<$Res>
    implements $ImageDetailStateCopyWith<$Res> {
  _$ImageDetailStateCopyWithImpl(this._value, this._then);

  final ImageDetailState _value;
  // ignore: unused_field
  final $Res Function(ImageDetailState) _then;
}

abstract class _$ImageDetailStateCopyWith<$Res> {
  factory _$ImageDetailStateCopyWith(
          _ImageDetailState value, $Res Function(_ImageDetailState) then) =
      __$ImageDetailStateCopyWithImpl<$Res>;
}

class __$ImageDetailStateCopyWithImpl<$Res>
    extends _$ImageDetailStateCopyWithImpl<$Res>
    implements _$ImageDetailStateCopyWith<$Res> {
  __$ImageDetailStateCopyWithImpl(
      _ImageDetailState _value, $Res Function(_ImageDetailState) _then)
      : super(_value, (v) => _then(v as _ImageDetailState));

  @override
  _ImageDetailState get _value => super._value as _ImageDetailState;
}

class _$_ImageDetailState
    with DiagnosticableTreeMixin
    implements _ImageDetailState {
  const _$_ImageDetailState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageDetailState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ImageDetailState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ImageDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(ImageEntity imageEntity),
    @required Result editing(ImageEntity imageEntity),
    @required Result delete(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return $default();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result viewing(ImageEntity imageEntity),
    Result editing(ImageEntity imageEntity),
    Result delete(),
    Result error(String message),
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
    Result $default(_ImageDetailState value), {
    @required Result loading(Loading value),
    @required Result viewing(Success value),
    @required Result editing(Editing value),
    @required Result delete(Deleted value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageDetailState value), {
    Result loading(Loading value),
    Result viewing(Success value),
    Result editing(Editing value),
    Result delete(Deleted value),
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

abstract class _ImageDetailState implements ImageDetailState {
  const factory _ImageDetailState() = _$_ImageDetailState;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$ImageDetailStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageDetailState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ImageDetailState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(ImageEntity imageEntity),
    @required Result editing(ImageEntity imageEntity),
    @required Result delete(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result viewing(ImageEntity imageEntity),
    Result editing(ImageEntity imageEntity),
    Result delete(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageDetailState value), {
    @required Result loading(Loading value),
    @required Result viewing(Success value),
    @required Result editing(Editing value),
    @required Result delete(Deleted value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageDetailState value), {
    Result loading(Loading value),
    Result viewing(Success value),
    Result editing(Editing value),
    Result delete(Deleted value),
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

abstract class Loading implements ImageDetailState {
  const factory Loading() = _$Loading;
}

abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({ImageEntity imageEntity});

  $ImageEntityCopyWith<$Res> get imageEntity;
}

class _$SuccessCopyWithImpl<$Res> extends _$ImageDetailStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object imageEntity = freezed,
  }) {
    return _then(Success(
      imageEntity: imageEntity == freezed
          ? _value.imageEntity
          : imageEntity as ImageEntity,
    ));
  }

  @override
  $ImageEntityCopyWith<$Res> get imageEntity {
    if (_value.imageEntity == null) {
      return null;
    }
    return $ImageEntityCopyWith<$Res>(_value.imageEntity, (value) {
      return _then(_value.copyWith(imageEntity: value));
    });
  }
}

class _$Success with DiagnosticableTreeMixin implements Success {
  const _$Success({@required this.imageEntity}) : assert(imageEntity != null);

  @override
  final ImageEntity imageEntity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageDetailState.viewing(imageEntity: $imageEntity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageDetailState.viewing'))
      ..add(DiagnosticsProperty('imageEntity', imageEntity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.imageEntity, imageEntity) ||
                const DeepCollectionEquality()
                    .equals(other.imageEntity, imageEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imageEntity);

  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(ImageEntity imageEntity),
    @required Result editing(ImageEntity imageEntity),
    @required Result delete(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return viewing(imageEntity);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result viewing(ImageEntity imageEntity),
    Result editing(ImageEntity imageEntity),
    Result delete(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (viewing != null) {
      return viewing(imageEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageDetailState value), {
    @required Result loading(Loading value),
    @required Result viewing(Success value),
    @required Result editing(Editing value),
    @required Result delete(Deleted value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return viewing(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageDetailState value), {
    Result loading(Loading value),
    Result viewing(Success value),
    Result editing(Editing value),
    Result delete(Deleted value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (viewing != null) {
      return viewing(this);
    }
    return orElse();
  }
}

abstract class Success implements ImageDetailState {
  const factory Success({@required ImageEntity imageEntity}) = _$Success;

  ImageEntity get imageEntity;
  $SuccessCopyWith<Success> get copyWith;
}

abstract class $EditingCopyWith<$Res> {
  factory $EditingCopyWith(Editing value, $Res Function(Editing) then) =
      _$EditingCopyWithImpl<$Res>;
  $Res call({ImageEntity imageEntity});

  $ImageEntityCopyWith<$Res> get imageEntity;
}

class _$EditingCopyWithImpl<$Res> extends _$ImageDetailStateCopyWithImpl<$Res>
    implements $EditingCopyWith<$Res> {
  _$EditingCopyWithImpl(Editing _value, $Res Function(Editing) _then)
      : super(_value, (v) => _then(v as Editing));

  @override
  Editing get _value => super._value as Editing;

  @override
  $Res call({
    Object imageEntity = freezed,
  }) {
    return _then(Editing(
      imageEntity: imageEntity == freezed
          ? _value.imageEntity
          : imageEntity as ImageEntity,
    ));
  }

  @override
  $ImageEntityCopyWith<$Res> get imageEntity {
    if (_value.imageEntity == null) {
      return null;
    }
    return $ImageEntityCopyWith<$Res>(_value.imageEntity, (value) {
      return _then(_value.copyWith(imageEntity: value));
    });
  }
}

class _$Editing with DiagnosticableTreeMixin implements Editing {
  const _$Editing({@required this.imageEntity}) : assert(imageEntity != null);

  @override
  final ImageEntity imageEntity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageDetailState.editing(imageEntity: $imageEntity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageDetailState.editing'))
      ..add(DiagnosticsProperty('imageEntity', imageEntity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Editing &&
            (identical(other.imageEntity, imageEntity) ||
                const DeepCollectionEquality()
                    .equals(other.imageEntity, imageEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imageEntity);

  @override
  $EditingCopyWith<Editing> get copyWith =>
      _$EditingCopyWithImpl<Editing>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(ImageEntity imageEntity),
    @required Result editing(ImageEntity imageEntity),
    @required Result delete(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return editing(imageEntity);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result viewing(ImageEntity imageEntity),
    Result editing(ImageEntity imageEntity),
    Result delete(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editing != null) {
      return editing(imageEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageDetailState value), {
    @required Result loading(Loading value),
    @required Result viewing(Success value),
    @required Result editing(Editing value),
    @required Result delete(Deleted value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return editing(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageDetailState value), {
    Result loading(Loading value),
    Result viewing(Success value),
    Result editing(Editing value),
    Result delete(Deleted value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class Editing implements ImageDetailState {
  const factory Editing({@required ImageEntity imageEntity}) = _$Editing;

  ImageEntity get imageEntity;
  $EditingCopyWith<Editing> get copyWith;
}

abstract class $DeletedCopyWith<$Res> {
  factory $DeletedCopyWith(Deleted value, $Res Function(Deleted) then) =
      _$DeletedCopyWithImpl<$Res>;
}

class _$DeletedCopyWithImpl<$Res> extends _$ImageDetailStateCopyWithImpl<$Res>
    implements $DeletedCopyWith<$Res> {
  _$DeletedCopyWithImpl(Deleted _value, $Res Function(Deleted) _then)
      : super(_value, (v) => _then(v as Deleted));

  @override
  Deleted get _value => super._value as Deleted;
}

class _$Deleted with DiagnosticableTreeMixin implements Deleted {
  const _$Deleted();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageDetailState.delete()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ImageDetailState.delete'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Deleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(ImageEntity imageEntity),
    @required Result editing(ImageEntity imageEntity),
    @required Result delete(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return delete();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result viewing(ImageEntity imageEntity),
    Result editing(ImageEntity imageEntity),
    Result delete(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageDetailState value), {
    @required Result loading(Loading value),
    @required Result viewing(Success value),
    @required Result editing(Editing value),
    @required Result delete(Deleted value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return delete(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageDetailState value), {
    Result loading(Loading value),
    Result viewing(Success value),
    Result editing(Editing value),
    Result delete(Deleted value),
    Result error(ErrorDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class Deleted implements ImageDetailState {
  const factory Deleted() = _$Deleted;
}

abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res>;
  $Res call({String message});
}

class _$ErrorDetailsCopyWithImpl<$Res>
    extends _$ImageDetailStateCopyWithImpl<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails _value, $Res Function(ErrorDetails) _then)
      : super(_value, (v) => _then(v as ErrorDetails));

  @override
  ErrorDetails get _value => super._value as ErrorDetails;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ErrorDetails(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails({this.message = ''}) : assert(message != null);

  @JsonKey(defaultValue: '')
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageDetailState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageDetailState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      _$ErrorDetailsCopyWithImpl<ErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(ImageEntity imageEntity),
    @required Result editing(ImageEntity imageEntity),
    @required Result delete(),
    @required Result error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result viewing(ImageEntity imageEntity),
    Result editing(ImageEntity imageEntity),
    Result delete(),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>(
    Result $default(_ImageDetailState value), {
    @required Result loading(Loading value),
    @required Result viewing(Success value),
    @required Result editing(Editing value),
    @required Result delete(Deleted value),
    @required Result error(ErrorDetails value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(viewing != null);
    assert(editing != null);
    assert(delete != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>(
    Result $default(_ImageDetailState value), {
    Result loading(Loading value),
    Result viewing(Success value),
    Result editing(Editing value),
    Result delete(Deleted value),
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

abstract class ErrorDetails implements ImageDetailState {
  const factory ErrorDetails({String message}) = _$ErrorDetails;

  String get message;
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith;
}
