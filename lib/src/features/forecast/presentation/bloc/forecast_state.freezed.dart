// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForecastState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchForecastLoading,
    required TResult Function(FetchForecastEntity forecastEntity)
        fetchForecastSuccess,
    required TResult Function(String error) fetchForecastError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchForecastLoading,
    TResult? Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult? Function(String error)? fetchForecastError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchForecastLoading,
    TResult Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult Function(String error)? fetchForecastError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FetchForecastLoading<T> value)
        fetchForecastLoading,
    required TResult Function(FetchForecastSuccess<T> value)
        fetchForecastSuccess,
    required TResult Function(FetchForecastError<T> value) fetchForecastError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult? Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult? Function(FetchForecastError<T> value)? fetchForecastError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult Function(FetchForecastError<T> value)? fetchForecastError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastStateCopyWith<T, $Res> {
  factory $ForecastStateCopyWith(
          ForecastState<T> value, $Res Function(ForecastState<T>) then) =
      _$ForecastStateCopyWithImpl<T, $Res, ForecastState<T>>;
}

/// @nodoc
class _$ForecastStateCopyWithImpl<T, $Res, $Val extends ForecastState<T>>
    implements $ForecastStateCopyWith<T, $Res> {
  _$ForecastStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ForecastStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ForecastState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchForecastLoading,
    required TResult Function(FetchForecastEntity forecastEntity)
        fetchForecastSuccess,
    required TResult Function(String error) fetchForecastError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchForecastLoading,
    TResult? Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult? Function(String error)? fetchForecastError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchForecastLoading,
    TResult Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult Function(String error)? fetchForecastError,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FetchForecastLoading<T> value)
        fetchForecastLoading,
    required TResult Function(FetchForecastSuccess<T> value)
        fetchForecastSuccess,
    required TResult Function(FetchForecastError<T> value) fetchForecastError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult? Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult? Function(FetchForecastError<T> value)? fetchForecastError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult Function(FetchForecastError<T> value)? fetchForecastError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ForecastState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$FetchForecastLoadingImplCopyWith<T, $Res> {
  factory _$$FetchForecastLoadingImplCopyWith(
          _$FetchForecastLoadingImpl<T> value,
          $Res Function(_$FetchForecastLoadingImpl<T>) then) =
      __$$FetchForecastLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$FetchForecastLoadingImplCopyWithImpl<T, $Res>
    extends _$ForecastStateCopyWithImpl<T, $Res, _$FetchForecastLoadingImpl<T>>
    implements _$$FetchForecastLoadingImplCopyWith<T, $Res> {
  __$$FetchForecastLoadingImplCopyWithImpl(_$FetchForecastLoadingImpl<T> _value,
      $Res Function(_$FetchForecastLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchForecastLoadingImpl<T> implements FetchForecastLoading<T> {
  const _$FetchForecastLoadingImpl();

  @override
  String toString() {
    return 'ForecastState<$T>.fetchForecastLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchForecastLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchForecastLoading,
    required TResult Function(FetchForecastEntity forecastEntity)
        fetchForecastSuccess,
    required TResult Function(String error) fetchForecastError,
  }) {
    return fetchForecastLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchForecastLoading,
    TResult? Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult? Function(String error)? fetchForecastError,
  }) {
    return fetchForecastLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchForecastLoading,
    TResult Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult Function(String error)? fetchForecastError,
    required TResult orElse(),
  }) {
    if (fetchForecastLoading != null) {
      return fetchForecastLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FetchForecastLoading<T> value)
        fetchForecastLoading,
    required TResult Function(FetchForecastSuccess<T> value)
        fetchForecastSuccess,
    required TResult Function(FetchForecastError<T> value) fetchForecastError,
  }) {
    return fetchForecastLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult? Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult? Function(FetchForecastError<T> value)? fetchForecastError,
  }) {
    return fetchForecastLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult Function(FetchForecastError<T> value)? fetchForecastError,
    required TResult orElse(),
  }) {
    if (fetchForecastLoading != null) {
      return fetchForecastLoading(this);
    }
    return orElse();
  }
}

abstract class FetchForecastLoading<T> implements ForecastState<T> {
  const factory FetchForecastLoading() = _$FetchForecastLoadingImpl<T>;
}

/// @nodoc
abstract class _$$FetchForecastSuccessImplCopyWith<T, $Res> {
  factory _$$FetchForecastSuccessImplCopyWith(
          _$FetchForecastSuccessImpl<T> value,
          $Res Function(_$FetchForecastSuccessImpl<T>) then) =
      __$$FetchForecastSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({FetchForecastEntity forecastEntity});
}

/// @nodoc
class __$$FetchForecastSuccessImplCopyWithImpl<T, $Res>
    extends _$ForecastStateCopyWithImpl<T, $Res, _$FetchForecastSuccessImpl<T>>
    implements _$$FetchForecastSuccessImplCopyWith<T, $Res> {
  __$$FetchForecastSuccessImplCopyWithImpl(_$FetchForecastSuccessImpl<T> _value,
      $Res Function(_$FetchForecastSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forecastEntity = null,
  }) {
    return _then(_$FetchForecastSuccessImpl<T>(
      null == forecastEntity
          ? _value.forecastEntity
          : forecastEntity // ignore: cast_nullable_to_non_nullable
              as FetchForecastEntity,
    ));
  }
}

/// @nodoc

class _$FetchForecastSuccessImpl<T> implements FetchForecastSuccess<T> {
  const _$FetchForecastSuccessImpl(this.forecastEntity);

  @override
  final FetchForecastEntity forecastEntity;

  @override
  String toString() {
    return 'ForecastState<$T>.fetchForecastSuccess(forecastEntity: $forecastEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchForecastSuccessImpl<T> &&
            (identical(other.forecastEntity, forecastEntity) ||
                other.forecastEntity == forecastEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forecastEntity);

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchForecastSuccessImplCopyWith<T, _$FetchForecastSuccessImpl<T>>
      get copyWith => __$$FetchForecastSuccessImplCopyWithImpl<T,
          _$FetchForecastSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchForecastLoading,
    required TResult Function(FetchForecastEntity forecastEntity)
        fetchForecastSuccess,
    required TResult Function(String error) fetchForecastError,
  }) {
    return fetchForecastSuccess(forecastEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchForecastLoading,
    TResult? Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult? Function(String error)? fetchForecastError,
  }) {
    return fetchForecastSuccess?.call(forecastEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchForecastLoading,
    TResult Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult Function(String error)? fetchForecastError,
    required TResult orElse(),
  }) {
    if (fetchForecastSuccess != null) {
      return fetchForecastSuccess(forecastEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FetchForecastLoading<T> value)
        fetchForecastLoading,
    required TResult Function(FetchForecastSuccess<T> value)
        fetchForecastSuccess,
    required TResult Function(FetchForecastError<T> value) fetchForecastError,
  }) {
    return fetchForecastSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult? Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult? Function(FetchForecastError<T> value)? fetchForecastError,
  }) {
    return fetchForecastSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult Function(FetchForecastError<T> value)? fetchForecastError,
    required TResult orElse(),
  }) {
    if (fetchForecastSuccess != null) {
      return fetchForecastSuccess(this);
    }
    return orElse();
  }
}

abstract class FetchForecastSuccess<T> implements ForecastState<T> {
  const factory FetchForecastSuccess(final FetchForecastEntity forecastEntity) =
      _$FetchForecastSuccessImpl<T>;

  FetchForecastEntity get forecastEntity;

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchForecastSuccessImplCopyWith<T, _$FetchForecastSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchForecastErrorImplCopyWith<T, $Res> {
  factory _$$FetchForecastErrorImplCopyWith(_$FetchForecastErrorImpl<T> value,
          $Res Function(_$FetchForecastErrorImpl<T>) then) =
      __$$FetchForecastErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FetchForecastErrorImplCopyWithImpl<T, $Res>
    extends _$ForecastStateCopyWithImpl<T, $Res, _$FetchForecastErrorImpl<T>>
    implements _$$FetchForecastErrorImplCopyWith<T, $Res> {
  __$$FetchForecastErrorImplCopyWithImpl(_$FetchForecastErrorImpl<T> _value,
      $Res Function(_$FetchForecastErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FetchForecastErrorImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchForecastErrorImpl<T> implements FetchForecastError<T> {
  const _$FetchForecastErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ForecastState<$T>.fetchForecastError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchForecastErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchForecastErrorImplCopyWith<T, _$FetchForecastErrorImpl<T>>
      get copyWith => __$$FetchForecastErrorImplCopyWithImpl<T,
          _$FetchForecastErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchForecastLoading,
    required TResult Function(FetchForecastEntity forecastEntity)
        fetchForecastSuccess,
    required TResult Function(String error) fetchForecastError,
  }) {
    return fetchForecastError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchForecastLoading,
    TResult? Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult? Function(String error)? fetchForecastError,
  }) {
    return fetchForecastError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchForecastLoading,
    TResult Function(FetchForecastEntity forecastEntity)? fetchForecastSuccess,
    TResult Function(String error)? fetchForecastError,
    required TResult orElse(),
  }) {
    if (fetchForecastError != null) {
      return fetchForecastError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(FetchForecastLoading<T> value)
        fetchForecastLoading,
    required TResult Function(FetchForecastSuccess<T> value)
        fetchForecastSuccess,
    required TResult Function(FetchForecastError<T> value) fetchForecastError,
  }) {
    return fetchForecastError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult? Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult? Function(FetchForecastError<T> value)? fetchForecastError,
  }) {
    return fetchForecastError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(FetchForecastLoading<T> value)? fetchForecastLoading,
    TResult Function(FetchForecastSuccess<T> value)? fetchForecastSuccess,
    TResult Function(FetchForecastError<T> value)? fetchForecastError,
    required TResult orElse(),
  }) {
    if (fetchForecastError != null) {
      return fetchForecastError(this);
    }
    return orElse();
  }
}

abstract class FetchForecastError<T> implements ForecastState<T> {
  const factory FetchForecastError(final String error) =
      _$FetchForecastErrorImpl<T>;

  String get error;

  /// Create a copy of ForecastState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchForecastErrorImplCopyWith<T, _$FetchForecastErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
