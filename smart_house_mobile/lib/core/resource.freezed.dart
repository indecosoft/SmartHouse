// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Resource<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BusinessException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BusinessException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BusinessException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T> value) initial,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T> value)? initial,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T> value)? initial,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<T, $Res> {
  factory $ResourceCopyWith(
          Resource<T> value, $Res Function(Resource<T>) then) =
      _$ResourceCopyWithImpl<T, $Res, Resource<T>>;
}

/// @nodoc
class _$ResourceCopyWithImpl<T, $Res, $Val extends Resource<T>>
    implements $ResourceCopyWith<T, $Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResourceInitialCopyWith<T, $Res> {
  factory _$$ResourceInitialCopyWith(_$ResourceInitial<T> value,
          $Res Function(_$ResourceInitial<T>) then) =
      __$$ResourceInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResourceInitialCopyWithImpl<T, $Res>
    extends _$ResourceCopyWithImpl<T, $Res, _$ResourceInitial<T>>
    implements _$$ResourceInitialCopyWith<T, $Res> {
  __$$ResourceInitialCopyWithImpl(
      _$ResourceInitial<T> _value, $Res Function(_$ResourceInitial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResourceInitial<T> implements ResourceInitial<T> {
  _$ResourceInitial();

  @override
  String toString() {
    return 'Resource<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResourceInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BusinessException error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BusinessException error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BusinessException error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T> value) initial,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T> value)? initial,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T> value)? initial,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ResourceInitial<T> implements Resource<T> {
  factory ResourceInitial() = _$ResourceInitial<T>;
}

/// @nodoc
abstract class _$$ResourceLoadingCopyWith<T, $Res> {
  factory _$$ResourceLoadingCopyWith(_$ResourceLoading<T> value,
          $Res Function(_$ResourceLoading<T>) then) =
      __$$ResourceLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ResourceLoadingCopyWithImpl<T, $Res>
    extends _$ResourceCopyWithImpl<T, $Res, _$ResourceLoading<T>>
    implements _$$ResourceLoadingCopyWith<T, $Res> {
  __$$ResourceLoadingCopyWithImpl(
      _$ResourceLoading<T> _value, $Res Function(_$ResourceLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResourceLoading<T> implements ResourceLoading<T> {
  _$ResourceLoading();

  @override
  String toString() {
    return 'Resource<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResourceLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BusinessException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BusinessException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BusinessException error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T> value) initial,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T> value)? initial,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T> value)? initial,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ResourceLoading<T> implements Resource<T> {
  factory ResourceLoading() = _$ResourceLoading<T>;
}

/// @nodoc
abstract class _$$ResourceSuccessCopyWith<T, $Res> {
  factory _$$ResourceSuccessCopyWith(_$ResourceSuccess<T> value,
          $Res Function(_$ResourceSuccess<T>) then) =
      __$$ResourceSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ResourceSuccessCopyWithImpl<T, $Res>
    extends _$ResourceCopyWithImpl<T, $Res, _$ResourceSuccess<T>>
    implements _$$ResourceSuccessCopyWith<T, $Res> {
  __$$ResourceSuccessCopyWithImpl(
      _$ResourceSuccess<T> _value, $Res Function(_$ResourceSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResourceSuccess<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ResourceSuccess<T> implements ResourceSuccess<T> {
  _$ResourceSuccess({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'Resource<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceSuccessCopyWith<T, _$ResourceSuccess<T>> get copyWith =>
      __$$ResourceSuccessCopyWithImpl<T, _$ResourceSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BusinessException error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BusinessException error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BusinessException error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T> value) initial,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T> value)? initial,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T> value)? initial,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ResourceSuccess<T> implements Resource<T> {
  factory ResourceSuccess({required final T data}) = _$ResourceSuccess<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ResourceSuccessCopyWith<T, _$ResourceSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResourceErrorCopyWith<T, $Res> {
  factory _$$ResourceErrorCopyWith(
          _$ResourceError<T> value, $Res Function(_$ResourceError<T>) then) =
      __$$ResourceErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({BusinessException error});
}

/// @nodoc
class __$$ResourceErrorCopyWithImpl<T, $Res>
    extends _$ResourceCopyWithImpl<T, $Res, _$ResourceError<T>>
    implements _$$ResourceErrorCopyWith<T, $Res> {
  __$$ResourceErrorCopyWithImpl(
      _$ResourceError<T> _value, $Res Function(_$ResourceError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ResourceError<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BusinessException,
    ));
  }
}

/// @nodoc

class _$ResourceError<T> implements ResourceError<T> {
  _$ResourceError({required this.error});

  @override
  final BusinessException error;

  @override
  String toString() {
    return 'Resource<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResourceError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResourceErrorCopyWith<T, _$ResourceError<T>> get copyWith =>
      __$$ResourceErrorCopyWithImpl<T, _$ResourceError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(BusinessException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(BusinessException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(BusinessException error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResourceInitial<T> value) initial,
    required TResult Function(ResourceLoading<T> value) loading,
    required TResult Function(ResourceSuccess<T> value) success,
    required TResult Function(ResourceError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResourceInitial<T> value)? initial,
    TResult? Function(ResourceLoading<T> value)? loading,
    TResult? Function(ResourceSuccess<T> value)? success,
    TResult? Function(ResourceError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResourceInitial<T> value)? initial,
    TResult Function(ResourceLoading<T> value)? loading,
    TResult Function(ResourceSuccess<T> value)? success,
    TResult Function(ResourceError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResourceError<T> implements Resource<T> {
  factory ResourceError({required final BusinessException error}) =
      _$ResourceError<T>;

  BusinessException get error;
  @JsonKey(ignore: true)
  _$$ResourceErrorCopyWith<T, _$ResourceError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
