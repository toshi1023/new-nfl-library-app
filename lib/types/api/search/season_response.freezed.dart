// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'season_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeasonResponse {
  int get season;

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeasonResponseCopyWith<SeasonResponse> get copyWith =>
      _$SeasonResponseCopyWithImpl<SeasonResponse>(
          this as SeasonResponse, _$identity);

  /// Serializes this SeasonResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeasonResponse &&
            (identical(other.season, season) || other.season == season));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, season);

  @override
  String toString() {
    return 'SeasonResponse(season: $season)';
  }
}

/// @nodoc
abstract mixin class $SeasonResponseCopyWith<$Res> {
  factory $SeasonResponseCopyWith(
          SeasonResponse value, $Res Function(SeasonResponse) _then) =
      _$SeasonResponseCopyWithImpl;
  @useResult
  $Res call({int season});
}

/// @nodoc
class _$SeasonResponseCopyWithImpl<$Res>
    implements $SeasonResponseCopyWith<$Res> {
  _$SeasonResponseCopyWithImpl(this._self, this._then);

  final SeasonResponse _self;
  final $Res Function(SeasonResponse) _then;

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? season = null,
  }) {
    return _then(_self.copyWith(
      season: null == season
          ? _self.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SeasonResponse].
extension SeasonResponsePatterns on SeasonResponse {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SeasonResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SeasonResponse() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_SeasonResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SeasonResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SeasonResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SeasonResponse() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int season)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SeasonResponse() when $default != null:
        return $default(_that.season);
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
  TResult when<TResult extends Object?>(
    TResult Function(int season) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SeasonResponse():
        return $default(_that.season);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int season)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SeasonResponse() when $default != null:
        return $default(_that.season);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SeasonResponse implements SeasonResponse {
  const _SeasonResponse({required this.season});
  factory _SeasonResponse.fromJson(Map<String, dynamic> json) =>
      _$SeasonResponseFromJson(json);

  @override
  final int season;

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SeasonResponseCopyWith<_SeasonResponse> get copyWith =>
      __$SeasonResponseCopyWithImpl<_SeasonResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SeasonResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SeasonResponse &&
            (identical(other.season, season) || other.season == season));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, season);

  @override
  String toString() {
    return 'SeasonResponse(season: $season)';
  }
}

/// @nodoc
abstract mixin class _$SeasonResponseCopyWith<$Res>
    implements $SeasonResponseCopyWith<$Res> {
  factory _$SeasonResponseCopyWith(
          _SeasonResponse value, $Res Function(_SeasonResponse) _then) =
      __$SeasonResponseCopyWithImpl;
  @override
  @useResult
  $Res call({int season});
}

/// @nodoc
class __$SeasonResponseCopyWithImpl<$Res>
    implements _$SeasonResponseCopyWith<$Res> {
  __$SeasonResponseCopyWithImpl(this._self, this._then);

  final _SeasonResponse _self;
  final $Res Function(_SeasonResponse) _then;

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? season = null,
  }) {
    return _then(_SeasonResponse(
      season: null == season
          ? _self.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
