// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamResponse {
  int get id;
  String get city;
  String get name;
  String? get conference;
  String? get area;
  @JsonKey(name: 'image_file')
  String? get imageFile;
  @JsonKey(name: 'back_image_file')
  String? get backImageFile;

  /// Create a copy of TeamResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TeamResponseCopyWith<TeamResponse> get copyWith =>
      _$TeamResponseCopyWithImpl<TeamResponse>(
          this as TeamResponse, _$identity);

  /// Serializes this TeamResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TeamResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.conference, conference) ||
                other.conference == conference) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.backImageFile, backImageFile) ||
                other.backImageFile == backImageFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, city, name, conference, area, imageFile, backImageFile);

  @override
  String toString() {
    return 'TeamResponse(id: $id, city: $city, name: $name, conference: $conference, area: $area, imageFile: $imageFile, backImageFile: $backImageFile)';
  }
}

/// @nodoc
abstract mixin class $TeamResponseCopyWith<$Res> {
  factory $TeamResponseCopyWith(
          TeamResponse value, $Res Function(TeamResponse) _then) =
      _$TeamResponseCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String city,
      String name,
      String? conference,
      String? area,
      @JsonKey(name: 'image_file') String? imageFile,
      @JsonKey(name: 'back_image_file') String? backImageFile});
}

/// @nodoc
class _$TeamResponseCopyWithImpl<$Res> implements $TeamResponseCopyWith<$Res> {
  _$TeamResponseCopyWithImpl(this._self, this._then);

  final TeamResponse _self;
  final $Res Function(TeamResponse) _then;

  /// Create a copy of TeamResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? city = null,
    Object? name = null,
    Object? conference = freezed,
    Object? area = freezed,
    Object? imageFile = freezed,
    Object? backImageFile = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conference: freezed == conference
          ? _self.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _self.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _self.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      backImageFile: freezed == backImageFile
          ? _self.backImageFile
          : backImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TeamResponse].
extension TeamResponsePatterns on TeamResponse {
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
    TResult Function(_TeamResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TeamResponse() when $default != null:
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
    TResult Function(_TeamResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TeamResponse():
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
    TResult? Function(_TeamResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TeamResponse() when $default != null:
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
    TResult Function(
            int id,
            String city,
            String name,
            String? conference,
            String? area,
            @JsonKey(name: 'image_file') String? imageFile,
            @JsonKey(name: 'back_image_file') String? backImageFile)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TeamResponse() when $default != null:
        return $default(_that.id, _that.city, _that.name, _that.conference,
            _that.area, _that.imageFile, _that.backImageFile);
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
    TResult Function(
            int id,
            String city,
            String name,
            String? conference,
            String? area,
            @JsonKey(name: 'image_file') String? imageFile,
            @JsonKey(name: 'back_image_file') String? backImageFile)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TeamResponse():
        return $default(_that.id, _that.city, _that.name, _that.conference,
            _that.area, _that.imageFile, _that.backImageFile);
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
    TResult? Function(
            int id,
            String city,
            String name,
            String? conference,
            String? area,
            @JsonKey(name: 'image_file') String? imageFile,
            @JsonKey(name: 'back_image_file') String? backImageFile)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TeamResponse() when $default != null:
        return $default(_that.id, _that.city, _that.name, _that.conference,
            _that.area, _that.imageFile, _that.backImageFile);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TeamResponse implements TeamResponse {
  const _TeamResponse(
      {required this.id,
      required this.city,
      required this.name,
      this.conference,
      this.area,
      @JsonKey(name: 'image_file') this.imageFile,
      @JsonKey(name: 'back_image_file') this.backImageFile});
  factory _TeamResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamResponseFromJson(json);

  @override
  final int id;
  @override
  final String city;
  @override
  final String name;
  @override
  final String? conference;
  @override
  final String? area;
  @override
  @JsonKey(name: 'image_file')
  final String? imageFile;
  @override
  @JsonKey(name: 'back_image_file')
  final String? backImageFile;

  /// Create a copy of TeamResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TeamResponseCopyWith<_TeamResponse> get copyWith =>
      __$TeamResponseCopyWithImpl<_TeamResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TeamResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TeamResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.conference, conference) ||
                other.conference == conference) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.backImageFile, backImageFile) ||
                other.backImageFile == backImageFile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, city, name, conference, area, imageFile, backImageFile);

  @override
  String toString() {
    return 'TeamResponse(id: $id, city: $city, name: $name, conference: $conference, area: $area, imageFile: $imageFile, backImageFile: $backImageFile)';
  }
}

/// @nodoc
abstract mixin class _$TeamResponseCopyWith<$Res>
    implements $TeamResponseCopyWith<$Res> {
  factory _$TeamResponseCopyWith(
          _TeamResponse value, $Res Function(_TeamResponse) _then) =
      __$TeamResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String city,
      String name,
      String? conference,
      String? area,
      @JsonKey(name: 'image_file') String? imageFile,
      @JsonKey(name: 'back_image_file') String? backImageFile});
}

/// @nodoc
class __$TeamResponseCopyWithImpl<$Res>
    implements _$TeamResponseCopyWith<$Res> {
  __$TeamResponseCopyWithImpl(this._self, this._then);

  final _TeamResponse _self;
  final $Res Function(_TeamResponse) _then;

  /// Create a copy of TeamResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? city = null,
    Object? name = null,
    Object? conference = freezed,
    Object? area = freezed,
    Object? imageFile = freezed,
    Object? backImageFile = freezed,
  }) {
    return _then(_TeamResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conference: freezed == conference
          ? _self.conference
          : conference // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _self.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _self.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      backImageFile: freezed == backImageFile
          ? _self.backImageFile
          : backImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
