// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ApiResult<T> _$ApiResultFromJson<T>(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'success':
      return ApiSuccess<T>.fromJson(json);
    case 'error':
      return ApiError<T>.fromJson(json);
    case 'validationError':
      return ApiValidationError<T>.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ApiResult',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ApiResult<T> {
  String get message;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiResultCopyWith<T, ApiResult<T>> get copyWith =>
      _$ApiResultCopyWithImpl<T, ApiResult<T>>(
          this as ApiResult<T>, _$identity);

  /// Serializes this ApiResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResult<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ApiResult<$T>(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ApiResultCopyWith<T, $Res> {
  factory $ApiResultCopyWith(
          ApiResult<T> value, $Res Function(ApiResult<T>) _then) =
      _$ApiResultCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ApiResultCopyWithImpl<T, $Res> implements $ApiResultCopyWith<T, $Res> {
  _$ApiResultCopyWithImpl(this._self, this._then);

  final ApiResult<T> _self;
  final $Res Function(ApiResult<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ApiResult].
extension ApiResultPatterns<T> on ApiResult<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiSuccess<T> value)? success,
    TResult Function(ApiError<T> value)? error,
    TResult Function(ApiValidationError<T> value)? validationError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ApiSuccess() when success != null:
        return success(_that);
      case ApiError() when error != null:
        return error(_that);
      case ApiValidationError() when validationError != null:
        return validationError(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiSuccess<T> value) success,
    required TResult Function(ApiError<T> value) error,
    required TResult Function(ApiValidationError<T> value) validationError,
  }) {
    final _that = this;
    switch (_that) {
      case ApiSuccess():
        return success(_that);
      case ApiError():
        return error(_that);
      case ApiValidationError():
        return validationError(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiSuccess<T> value)? success,
    TResult? Function(ApiError<T> value)? error,
    TResult? Function(ApiValidationError<T> value)? validationError,
  }) {
    final _that = this;
    switch (_that) {
      case ApiSuccess() when success != null:
        return success(_that);
      case ApiError() when error != null:
        return error(_that);
      case ApiValidationError() when validationError != null:
        return validationError(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message,
            @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data)?
        success,
    TResult Function(String message, String error)? error,
    TResult Function(
            String message,
            @JsonKey(fromJson: _errorsFromJson, toJson: _errorsToJson)
            Map<String, List<String>> errors)?
        validationError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ApiSuccess() when success != null:
        return success(_that.message, _that.data);
      case ApiError() when error != null:
        return error(_that.message, _that.error);
      case ApiValidationError() when validationError != null:
        return validationError(_that.message, _that.errors);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message,
            @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data)
        success,
    required TResult Function(String message, String error) error,
    required TResult Function(
            String message,
            @JsonKey(fromJson: _errorsFromJson, toJson: _errorsToJson)
            Map<String, List<String>> errors)
        validationError,
  }) {
    final _that = this;
    switch (_that) {
      case ApiSuccess():
        return success(_that.message, _that.data);
      case ApiError():
        return error(_that.message, _that.error);
      case ApiValidationError():
        return validationError(_that.message, _that.errors);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message,
            @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data)?
        success,
    TResult? Function(String message, String error)? error,
    TResult? Function(
            String message,
            @JsonKey(fromJson: _errorsFromJson, toJson: _errorsToJson)
            Map<String, List<String>> errors)?
        validationError,
  }) {
    final _that = this;
    switch (_that) {
      case ApiSuccess() when success != null:
        return success(_that.message, _that.data);
      case ApiError() when error != null:
        return error(_that.message, _that.error);
      case ApiValidationError() when validationError != null:
        return validationError(_that.message, _that.errors);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class ApiSuccess<T> implements ApiResult<T> {
  const ApiSuccess(
      {required this.message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) required this.data,
      final String? $type})
      : $type = $type ?? 'success';
  factory ApiSuccess.fromJson(Map<String, dynamic> json) =>
      _$ApiSuccessFromJson(json);

  @override
  final String message;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final T data;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiSuccessCopyWith<T, ApiSuccess<T>> get copyWith =>
      _$ApiSuccessCopyWithImpl<T, ApiSuccess<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ApiSuccessToJson<T>(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiSuccess<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ApiResult<$T>.success(message: $message, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ApiSuccessCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $ApiSuccessCopyWith(
          ApiSuccess<T> value, $Res Function(ApiSuccess<T>) _then) =
      _$ApiSuccessCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data});
}

/// @nodoc
class _$ApiSuccessCopyWithImpl<T, $Res>
    implements $ApiSuccessCopyWith<T, $Res> {
  _$ApiSuccessCopyWithImpl(this._self, this._then);

  final ApiSuccess<T> _self;
  final $Res Function(ApiSuccess<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(ApiSuccess<T>(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ApiError<T> implements ApiResult<T> {
  const ApiError(
      {required this.message, required this.error, final String? $type})
      : $type = $type ?? 'error';
  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  @override
  final String message;
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiErrorCopyWith<T, ApiError<T>> get copyWith =>
      _$ApiErrorCopyWithImpl<T, ApiError<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ApiErrorToJson<T>(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiError<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, error);

  @override
  String toString() {
    return 'ApiResult<$T>.error(message: $message, error: $error)';
  }
}

/// @nodoc
abstract mixin class $ApiErrorCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $ApiErrorCopyWith(
          ApiError<T> value, $Res Function(ApiError<T>) _then) =
      _$ApiErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String message, String error});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<T, $Res> implements $ApiErrorCopyWith<T, $Res> {
  _$ApiErrorCopyWithImpl(this._self, this._then);

  final ApiError<T> _self;
  final $Res Function(ApiError<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? error = null,
  }) {
    return _then(ApiError<T>(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class ApiValidationError<T> implements ApiResult<T> {
  const ApiValidationError(
      {required this.message,
      @JsonKey(fromJson: _errorsFromJson, toJson: _errorsToJson)
      required final Map<String, List<String>> errors,
      final String? $type})
      : _errors = errors,
        $type = $type ?? 'validationError';
  factory ApiValidationError.fromJson(Map<String, dynamic> json) =>
      _$ApiValidationErrorFromJson(json);

  @override
  final String message;
  final Map<String, List<String>> _errors;
  @JsonKey(fromJson: _errorsFromJson, toJson: _errorsToJson)
  Map<String, List<String>> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiValidationErrorCopyWith<T, ApiValidationError<T>> get copyWith =>
      _$ApiValidationErrorCopyWithImpl<T, ApiValidationError<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ApiValidationErrorToJson<T>(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiValidationError<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'ApiResult<$T>.validationError(message: $message, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $ApiValidationErrorCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $ApiValidationErrorCopyWith(ApiValidationError<T> value,
          $Res Function(ApiValidationError<T>) _then) =
      _$ApiValidationErrorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String message,
      @JsonKey(fromJson: _errorsFromJson, toJson: _errorsToJson)
      Map<String, List<String>> errors});
}

/// @nodoc
class _$ApiValidationErrorCopyWithImpl<T, $Res>
    implements $ApiValidationErrorCopyWith<T, $Res> {
  _$ApiValidationErrorCopyWithImpl(this._self, this._then);

  final ApiValidationError<T> _self;
  final $Res Function(ApiValidationError<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? errors = null,
  }) {
    return _then(ApiValidationError<T>(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errors: null == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

// dart format on
