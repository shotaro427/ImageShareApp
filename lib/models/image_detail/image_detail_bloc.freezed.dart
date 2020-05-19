// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'image_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ImageDetailState {
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(@required ImageEntity imageEntity),
    @required Result editing(@required ImageEntity imageEntity),
    @required Result delete(),
    @required Result error(String message),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>(
    Result $default(), {
    Result loading(),
    Result viewing(@required ImageEntity imageEntity),
    Result editing(@required ImageEntity imageEntity),
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

class _$ImageDetailStateTearOff {
  const _$ImageDetailStateTearOff();

  _ImageDetailState call() {
    return const _ImageDetailState();
  }

  Loading loading() {
    return const Loading();
  }

  Success viewing({@required ImageEntity imageEntity}) {
    return Success(
      imageEntity: imageEntity,
    );
  }

  Editing editing({@required ImageEntity imageEntity}) {
    return Editing(
      imageEntity: imageEntity,
    );
  }

  Deleted delete() {
    return const Deleted();
  }

  ErrorDetails error({String message = ''}) {
    return ErrorDetails(
      message: message,
    );
  }
}

const $ImageDetailState = _$ImageDetailStateTearOff();

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
    @required Result viewing(@required ImageEntity imageEntity),
    @required Result editing(@required ImageEntity imageEntity),
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
    Result viewing(@required ImageEntity imageEntity),
    Result editing(@required ImageEntity imageEntity),
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
    @required Result viewing(@required ImageEntity imageEntity),
    @required Result editing(@required ImageEntity imageEntity),
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
    Result viewing(@required ImageEntity imageEntity),
    Result editing(@required ImageEntity imageEntity),
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
  _$Success copyWith({
    Object imageEntity = freezed,
  }) {
    return _$Success(
      imageEntity: imageEntity == freezed
          ? this.imageEntity
          : imageEntity as ImageEntity,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(@required ImageEntity imageEntity),
    @required Result editing(@required ImageEntity imageEntity),
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
    Result viewing(@required ImageEntity imageEntity),
    Result editing(@required ImageEntity imageEntity),
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

  Success copyWith({ImageEntity imageEntity});
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
  _$Editing copyWith({
    Object imageEntity = freezed,
  }) {
    return _$Editing(
      imageEntity: imageEntity == freezed
          ? this.imageEntity
          : imageEntity as ImageEntity,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(@required ImageEntity imageEntity),
    @required Result editing(@required ImageEntity imageEntity),
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
    Result viewing(@required ImageEntity imageEntity),
    Result editing(@required ImageEntity imageEntity),
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

  Editing copyWith({ImageEntity imageEntity});
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
    @required Result viewing(@required ImageEntity imageEntity),
    @required Result editing(@required ImageEntity imageEntity),
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
    Result viewing(@required ImageEntity imageEntity),
    Result editing(@required ImageEntity imageEntity),
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

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails({this.message = ''});

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
  _$ErrorDetails copyWith({
    Object message = freezed,
  }) {
    return _$ErrorDetails(
      message: message == freezed ? this.message : message as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>(
    Result $default(), {
    @required Result loading(),
    @required Result viewing(@required ImageEntity imageEntity),
    @required Result editing(@required ImageEntity imageEntity),
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
    Result viewing(@required ImageEntity imageEntity),
    Result editing(@required ImageEntity imageEntity),
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

  ErrorDetails copyWith({String message});
}
