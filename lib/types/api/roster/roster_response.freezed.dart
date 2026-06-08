// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roster_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RosterResponse {
  int get id;
  int get season;
  @JsonKey(name: 'team_id')
  int get teamId;
  @JsonKey(name: 'player_id')
  int get playerId;
  @JsonKey(name: 'position_id')
  int get positionId;
  int get number;
  int? get rating;
  int get experience;
  RosterPlayerResponse get player;
  RosterPositionResponse get position;

  /// Create a copy of RosterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RosterResponseCopyWith<RosterResponse> get copyWith =>
      _$RosterResponseCopyWithImpl<RosterResponse>(
          this as RosterResponse, _$identity);

  /// Serializes this RosterResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RosterResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, season, teamId, playerId,
      positionId, number, rating, experience, player, position);

  @override
  String toString() {
    return 'RosterResponse(id: $id, season: $season, teamId: $teamId, playerId: $playerId, positionId: $positionId, number: $number, rating: $rating, experience: $experience, player: $player, position: $position)';
  }
}

/// @nodoc
abstract mixin class $RosterResponseCopyWith<$Res> {
  factory $RosterResponseCopyWith(
          RosterResponse value, $Res Function(RosterResponse) _then) =
      _$RosterResponseCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int season,
      @JsonKey(name: 'team_id') int teamId,
      @JsonKey(name: 'player_id') int playerId,
      @JsonKey(name: 'position_id') int positionId,
      int number,
      int? rating,
      int experience,
      RosterPlayerResponse player,
      RosterPositionResponse position});

  $RosterPlayerResponseCopyWith<$Res> get player;
  $RosterPositionResponseCopyWith<$Res> get position;
}

/// @nodoc
class _$RosterResponseCopyWithImpl<$Res>
    implements $RosterResponseCopyWith<$Res> {
  _$RosterResponseCopyWithImpl(this._self, this._then);

  final RosterResponse _self;
  final $Res Function(RosterResponse) _then;

  /// Create a copy of RosterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? season = null,
    Object? teamId = null,
    Object? playerId = null,
    Object? positionId = null,
    Object? number = null,
    Object? rating = freezed,
    Object? experience = null,
    Object? player = null,
    Object? position = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      season: null == season
          ? _self.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _self.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      playerId: null == playerId
          ? _self.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      positionId: null == positionId
          ? _self.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      experience: null == experience
          ? _self.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int,
      player: null == player
          ? _self.player
          : player // ignore: cast_nullable_to_non_nullable
              as RosterPlayerResponse,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as RosterPositionResponse,
    ));
  }

  /// Create a copy of RosterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RosterPlayerResponseCopyWith<$Res> get player {
    return $RosterPlayerResponseCopyWith<$Res>(_self.player, (value) {
      return _then(_self.copyWith(player: value));
    });
  }

  /// Create a copy of RosterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RosterPositionResponseCopyWith<$Res> get position {
    return $RosterPositionResponseCopyWith<$Res>(_self.position, (value) {
      return _then(_self.copyWith(position: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RosterResponse].
extension RosterResponsePatterns on RosterResponse {
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
    TResult Function(_RosterResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RosterResponse() when $default != null:
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
    TResult Function(_RosterResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterResponse():
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
    TResult? Function(_RosterResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterResponse() when $default != null:
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
            int season,
            @JsonKey(name: 'team_id') int teamId,
            @JsonKey(name: 'player_id') int playerId,
            @JsonKey(name: 'position_id') int positionId,
            int number,
            int? rating,
            int experience,
            RosterPlayerResponse player,
            RosterPositionResponse position)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RosterResponse() when $default != null:
        return $default(
            _that.id,
            _that.season,
            _that.teamId,
            _that.playerId,
            _that.positionId,
            _that.number,
            _that.rating,
            _that.experience,
            _that.player,
            _that.position);
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
            int season,
            @JsonKey(name: 'team_id') int teamId,
            @JsonKey(name: 'player_id') int playerId,
            @JsonKey(name: 'position_id') int positionId,
            int number,
            int? rating,
            int experience,
            RosterPlayerResponse player,
            RosterPositionResponse position)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterResponse():
        return $default(
            _that.id,
            _that.season,
            _that.teamId,
            _that.playerId,
            _that.positionId,
            _that.number,
            _that.rating,
            _that.experience,
            _that.player,
            _that.position);
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
            int season,
            @JsonKey(name: 'team_id') int teamId,
            @JsonKey(name: 'player_id') int playerId,
            @JsonKey(name: 'position_id') int positionId,
            int number,
            int? rating,
            int experience,
            RosterPlayerResponse player,
            RosterPositionResponse position)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterResponse() when $default != null:
        return $default(
            _that.id,
            _that.season,
            _that.teamId,
            _that.playerId,
            _that.positionId,
            _that.number,
            _that.rating,
            _that.experience,
            _that.player,
            _that.position);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RosterResponse implements RosterResponse {
  const _RosterResponse(
      {required this.id,
      required this.season,
      @JsonKey(name: 'team_id') required this.teamId,
      @JsonKey(name: 'player_id') required this.playerId,
      @JsonKey(name: 'position_id') required this.positionId,
      required this.number,
      this.rating,
      required this.experience,
      required this.player,
      required this.position});
  factory _RosterResponse.fromJson(Map<String, dynamic> json) =>
      _$RosterResponseFromJson(json);

  @override
  final int id;
  @override
  final int season;
  @override
  @JsonKey(name: 'team_id')
  final int teamId;
  @override
  @JsonKey(name: 'player_id')
  final int playerId;
  @override
  @JsonKey(name: 'position_id')
  final int positionId;
  @override
  final int number;
  @override
  final int? rating;
  @override
  final int experience;
  @override
  final RosterPlayerResponse player;
  @override
  final RosterPositionResponse position;

  /// Create a copy of RosterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RosterResponseCopyWith<_RosterResponse> get copyWith =>
      __$RosterResponseCopyWithImpl<_RosterResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RosterResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RosterResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.season, season) || other.season == season) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, season, teamId, playerId,
      positionId, number, rating, experience, player, position);

  @override
  String toString() {
    return 'RosterResponse(id: $id, season: $season, teamId: $teamId, playerId: $playerId, positionId: $positionId, number: $number, rating: $rating, experience: $experience, player: $player, position: $position)';
  }
}

/// @nodoc
abstract mixin class _$RosterResponseCopyWith<$Res>
    implements $RosterResponseCopyWith<$Res> {
  factory _$RosterResponseCopyWith(
          _RosterResponse value, $Res Function(_RosterResponse) _then) =
      __$RosterResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int season,
      @JsonKey(name: 'team_id') int teamId,
      @JsonKey(name: 'player_id') int playerId,
      @JsonKey(name: 'position_id') int positionId,
      int number,
      int? rating,
      int experience,
      RosterPlayerResponse player,
      RosterPositionResponse position});

  @override
  $RosterPlayerResponseCopyWith<$Res> get player;
  @override
  $RosterPositionResponseCopyWith<$Res> get position;
}

/// @nodoc
class __$RosterResponseCopyWithImpl<$Res>
    implements _$RosterResponseCopyWith<$Res> {
  __$RosterResponseCopyWithImpl(this._self, this._then);

  final _RosterResponse _self;
  final $Res Function(_RosterResponse) _then;

  /// Create a copy of RosterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? season = null,
    Object? teamId = null,
    Object? playerId = null,
    Object? positionId = null,
    Object? number = null,
    Object? rating = freezed,
    Object? experience = null,
    Object? player = null,
    Object? position = null,
  }) {
    return _then(_RosterResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      season: null == season
          ? _self.season
          : season // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _self.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      playerId: null == playerId
          ? _self.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      positionId: null == positionId
          ? _self.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      experience: null == experience
          ? _self.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as int,
      player: null == player
          ? _self.player
          : player // ignore: cast_nullable_to_non_nullable
              as RosterPlayerResponse,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as RosterPositionResponse,
    ));
  }

  /// Create a copy of RosterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RosterPlayerResponseCopyWith<$Res> get player {
    return $RosterPlayerResponseCopyWith<$Res>(_self.player, (value) {
      return _then(_self.copyWith(player: value));
    });
  }

  /// Create a copy of RosterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RosterPositionResponseCopyWith<$Res> get position {
    return $RosterPositionResponseCopyWith<$Res>(_self.position, (value) {
      return _then(_self.copyWith(position: value));
    });
  }
}

/// @nodoc
mixin _$RosterPlayerResponse {
  int get id;
  String get firstname;
  String get lastname;
  String get birthday;
  double? get height;
  double? get weight;
  String? get college;
  @JsonKey(name: 'drafted_team')
  String? get draftedTeam;
  @JsonKey(name: 'drafted_round')
  String? get draftedRound;
  @JsonKey(name: 'drafted_rank')
  String? get draftedRank;
  @JsonKey(name: 'drafted_year')
  int? get draftedYear;
  @JsonKey(name: 'image_file')
  String? get imageFile;
  @JsonKey(name: 'birthday_year')
  int? get birthdayYear;
  @JsonKey(name: 'birthday_date')
  String? get birthdayDate;
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of RosterPlayerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RosterPlayerResponseCopyWith<RosterPlayerResponse> get copyWith =>
      _$RosterPlayerResponseCopyWithImpl<RosterPlayerResponse>(
          this as RosterPlayerResponse, _$identity);

  /// Serializes this RosterPlayerResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RosterPlayerResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.college, college) || other.college == college) &&
            (identical(other.draftedTeam, draftedTeam) ||
                other.draftedTeam == draftedTeam) &&
            (identical(other.draftedRound, draftedRound) ||
                other.draftedRound == draftedRound) &&
            (identical(other.draftedRank, draftedRank) ||
                other.draftedRank == draftedRank) &&
            (identical(other.draftedYear, draftedYear) ||
                other.draftedYear == draftedYear) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.birthdayYear, birthdayYear) ||
                other.birthdayYear == birthdayYear) &&
            (identical(other.birthdayDate, birthdayDate) ||
                other.birthdayDate == birthdayDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstname,
      lastname,
      birthday,
      height,
      weight,
      college,
      draftedTeam,
      draftedRound,
      draftedRank,
      draftedYear,
      imageFile,
      birthdayYear,
      birthdayDate,
      imageUrl);

  @override
  String toString() {
    return 'RosterPlayerResponse(id: $id, firstname: $firstname, lastname: $lastname, birthday: $birthday, height: $height, weight: $weight, college: $college, draftedTeam: $draftedTeam, draftedRound: $draftedRound, draftedRank: $draftedRank, draftedYear: $draftedYear, imageFile: $imageFile, birthdayYear: $birthdayYear, birthdayDate: $birthdayDate, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $RosterPlayerResponseCopyWith<$Res> {
  factory $RosterPlayerResponseCopyWith(RosterPlayerResponse value,
          $Res Function(RosterPlayerResponse) _then) =
      _$RosterPlayerResponseCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String firstname,
      String lastname,
      String birthday,
      double? height,
      double? weight,
      String? college,
      @JsonKey(name: 'drafted_team') String? draftedTeam,
      @JsonKey(name: 'drafted_round') String? draftedRound,
      @JsonKey(name: 'drafted_rank') String? draftedRank,
      @JsonKey(name: 'drafted_year') int? draftedYear,
      @JsonKey(name: 'image_file') String? imageFile,
      @JsonKey(name: 'birthday_year') int? birthdayYear,
      @JsonKey(name: 'birthday_date') String? birthdayDate,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$RosterPlayerResponseCopyWithImpl<$Res>
    implements $RosterPlayerResponseCopyWith<$Res> {
  _$RosterPlayerResponseCopyWithImpl(this._self, this._then);

  final RosterPlayerResponse _self;
  final $Res Function(RosterPlayerResponse) _then;

  /// Create a copy of RosterPlayerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? birthday = null,
    Object? height = freezed,
    Object? weight = freezed,
    Object? college = freezed,
    Object? draftedTeam = freezed,
    Object? draftedRound = freezed,
    Object? draftedRank = freezed,
    Object? draftedYear = freezed,
    Object? imageFile = freezed,
    Object? birthdayYear = freezed,
    Object? birthdayDate = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: null == firstname
          ? _self.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _self.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _self.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      college: freezed == college
          ? _self.college
          : college // ignore: cast_nullable_to_non_nullable
              as String?,
      draftedTeam: freezed == draftedTeam
          ? _self.draftedTeam
          : draftedTeam // ignore: cast_nullable_to_non_nullable
              as String?,
      draftedRound: freezed == draftedRound
          ? _self.draftedRound
          : draftedRound // ignore: cast_nullable_to_non_nullable
              as String?,
      draftedRank: freezed == draftedRank
          ? _self.draftedRank
          : draftedRank // ignore: cast_nullable_to_non_nullable
              as String?,
      draftedYear: freezed == draftedYear
          ? _self.draftedYear
          : draftedYear // ignore: cast_nullable_to_non_nullable
              as int?,
      imageFile: freezed == imageFile
          ? _self.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdayYear: freezed == birthdayYear
          ? _self.birthdayYear
          : birthdayYear // ignore: cast_nullable_to_non_nullable
              as int?,
      birthdayDate: freezed == birthdayDate
          ? _self.birthdayDate
          : birthdayDate // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RosterPlayerResponse].
extension RosterPlayerResponsePatterns on RosterPlayerResponse {
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
    TResult Function(_RosterPlayerResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RosterPlayerResponse() when $default != null:
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
    TResult Function(_RosterPlayerResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterPlayerResponse():
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
    TResult? Function(_RosterPlayerResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterPlayerResponse() when $default != null:
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
            String firstname,
            String lastname,
            String birthday,
            double? height,
            double? weight,
            String? college,
            @JsonKey(name: 'drafted_team') String? draftedTeam,
            @JsonKey(name: 'drafted_round') String? draftedRound,
            @JsonKey(name: 'drafted_rank') String? draftedRank,
            @JsonKey(name: 'drafted_year') int? draftedYear,
            @JsonKey(name: 'image_file') String? imageFile,
            @JsonKey(name: 'birthday_year') int? birthdayYear,
            @JsonKey(name: 'birthday_date') String? birthdayDate,
            @JsonKey(name: 'image_url') String? imageUrl)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RosterPlayerResponse() when $default != null:
        return $default(
            _that.id,
            _that.firstname,
            _that.lastname,
            _that.birthday,
            _that.height,
            _that.weight,
            _that.college,
            _that.draftedTeam,
            _that.draftedRound,
            _that.draftedRank,
            _that.draftedYear,
            _that.imageFile,
            _that.birthdayYear,
            _that.birthdayDate,
            _that.imageUrl);
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
            String firstname,
            String lastname,
            String birthday,
            double? height,
            double? weight,
            String? college,
            @JsonKey(name: 'drafted_team') String? draftedTeam,
            @JsonKey(name: 'drafted_round') String? draftedRound,
            @JsonKey(name: 'drafted_rank') String? draftedRank,
            @JsonKey(name: 'drafted_year') int? draftedYear,
            @JsonKey(name: 'image_file') String? imageFile,
            @JsonKey(name: 'birthday_year') int? birthdayYear,
            @JsonKey(name: 'birthday_date') String? birthdayDate,
            @JsonKey(name: 'image_url') String? imageUrl)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterPlayerResponse():
        return $default(
            _that.id,
            _that.firstname,
            _that.lastname,
            _that.birthday,
            _that.height,
            _that.weight,
            _that.college,
            _that.draftedTeam,
            _that.draftedRound,
            _that.draftedRank,
            _that.draftedYear,
            _that.imageFile,
            _that.birthdayYear,
            _that.birthdayDate,
            _that.imageUrl);
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
            String firstname,
            String lastname,
            String birthday,
            double? height,
            double? weight,
            String? college,
            @JsonKey(name: 'drafted_team') String? draftedTeam,
            @JsonKey(name: 'drafted_round') String? draftedRound,
            @JsonKey(name: 'drafted_rank') String? draftedRank,
            @JsonKey(name: 'drafted_year') int? draftedYear,
            @JsonKey(name: 'image_file') String? imageFile,
            @JsonKey(name: 'birthday_year') int? birthdayYear,
            @JsonKey(name: 'birthday_date') String? birthdayDate,
            @JsonKey(name: 'image_url') String? imageUrl)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterPlayerResponse() when $default != null:
        return $default(
            _that.id,
            _that.firstname,
            _that.lastname,
            _that.birthday,
            _that.height,
            _that.weight,
            _that.college,
            _that.draftedTeam,
            _that.draftedRound,
            _that.draftedRank,
            _that.draftedYear,
            _that.imageFile,
            _that.birthdayYear,
            _that.birthdayDate,
            _that.imageUrl);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RosterPlayerResponse implements RosterPlayerResponse {
  const _RosterPlayerResponse(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.birthday,
      this.height,
      this.weight,
      this.college,
      @JsonKey(name: 'drafted_team') this.draftedTeam,
      @JsonKey(name: 'drafted_round') this.draftedRound,
      @JsonKey(name: 'drafted_rank') this.draftedRank,
      @JsonKey(name: 'drafted_year') this.draftedYear,
      @JsonKey(name: 'image_file') this.imageFile,
      @JsonKey(name: 'birthday_year') this.birthdayYear,
      @JsonKey(name: 'birthday_date') this.birthdayDate,
      @JsonKey(name: 'image_url') this.imageUrl});
  factory _RosterPlayerResponse.fromJson(Map<String, dynamic> json) =>
      _$RosterPlayerResponseFromJson(json);

  @override
  final int id;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String birthday;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final String? college;
  @override
  @JsonKey(name: 'drafted_team')
  final String? draftedTeam;
  @override
  @JsonKey(name: 'drafted_round')
  final String? draftedRound;
  @override
  @JsonKey(name: 'drafted_rank')
  final String? draftedRank;
  @override
  @JsonKey(name: 'drafted_year')
  final int? draftedYear;
  @override
  @JsonKey(name: 'image_file')
  final String? imageFile;
  @override
  @JsonKey(name: 'birthday_year')
  final int? birthdayYear;
  @override
  @JsonKey(name: 'birthday_date')
  final String? birthdayDate;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  /// Create a copy of RosterPlayerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RosterPlayerResponseCopyWith<_RosterPlayerResponse> get copyWith =>
      __$RosterPlayerResponseCopyWithImpl<_RosterPlayerResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RosterPlayerResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RosterPlayerResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.college, college) || other.college == college) &&
            (identical(other.draftedTeam, draftedTeam) ||
                other.draftedTeam == draftedTeam) &&
            (identical(other.draftedRound, draftedRound) ||
                other.draftedRound == draftedRound) &&
            (identical(other.draftedRank, draftedRank) ||
                other.draftedRank == draftedRank) &&
            (identical(other.draftedYear, draftedYear) ||
                other.draftedYear == draftedYear) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            (identical(other.birthdayYear, birthdayYear) ||
                other.birthdayYear == birthdayYear) &&
            (identical(other.birthdayDate, birthdayDate) ||
                other.birthdayDate == birthdayDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstname,
      lastname,
      birthday,
      height,
      weight,
      college,
      draftedTeam,
      draftedRound,
      draftedRank,
      draftedYear,
      imageFile,
      birthdayYear,
      birthdayDate,
      imageUrl);

  @override
  String toString() {
    return 'RosterPlayerResponse(id: $id, firstname: $firstname, lastname: $lastname, birthday: $birthday, height: $height, weight: $weight, college: $college, draftedTeam: $draftedTeam, draftedRound: $draftedRound, draftedRank: $draftedRank, draftedYear: $draftedYear, imageFile: $imageFile, birthdayYear: $birthdayYear, birthdayDate: $birthdayDate, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$RosterPlayerResponseCopyWith<$Res>
    implements $RosterPlayerResponseCopyWith<$Res> {
  factory _$RosterPlayerResponseCopyWith(_RosterPlayerResponse value,
          $Res Function(_RosterPlayerResponse) _then) =
      __$RosterPlayerResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String firstname,
      String lastname,
      String birthday,
      double? height,
      double? weight,
      String? college,
      @JsonKey(name: 'drafted_team') String? draftedTeam,
      @JsonKey(name: 'drafted_round') String? draftedRound,
      @JsonKey(name: 'drafted_rank') String? draftedRank,
      @JsonKey(name: 'drafted_year') int? draftedYear,
      @JsonKey(name: 'image_file') String? imageFile,
      @JsonKey(name: 'birthday_year') int? birthdayYear,
      @JsonKey(name: 'birthday_date') String? birthdayDate,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$RosterPlayerResponseCopyWithImpl<$Res>
    implements _$RosterPlayerResponseCopyWith<$Res> {
  __$RosterPlayerResponseCopyWithImpl(this._self, this._then);

  final _RosterPlayerResponse _self;
  final $Res Function(_RosterPlayerResponse) _then;

  /// Create a copy of RosterPlayerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? birthday = null,
    Object? height = freezed,
    Object? weight = freezed,
    Object? college = freezed,
    Object? draftedTeam = freezed,
    Object? draftedRound = freezed,
    Object? draftedRank = freezed,
    Object? draftedYear = freezed,
    Object? imageFile = freezed,
    Object? birthdayYear = freezed,
    Object? birthdayDate = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_RosterPlayerResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: null == firstname
          ? _self.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _self.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _self.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      college: freezed == college
          ? _self.college
          : college // ignore: cast_nullable_to_non_nullable
              as String?,
      draftedTeam: freezed == draftedTeam
          ? _self.draftedTeam
          : draftedTeam // ignore: cast_nullable_to_non_nullable
              as String?,
      draftedRound: freezed == draftedRound
          ? _self.draftedRound
          : draftedRound // ignore: cast_nullable_to_non_nullable
              as String?,
      draftedRank: freezed == draftedRank
          ? _self.draftedRank
          : draftedRank // ignore: cast_nullable_to_non_nullable
              as String?,
      draftedYear: freezed == draftedYear
          ? _self.draftedYear
          : draftedYear // ignore: cast_nullable_to_non_nullable
              as int?,
      imageFile: freezed == imageFile
          ? _self.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdayYear: freezed == birthdayYear
          ? _self.birthdayYear
          : birthdayYear // ignore: cast_nullable_to_non_nullable
              as int?,
      birthdayDate: freezed == birthdayDate
          ? _self.birthdayDate
          : birthdayDate // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$RosterPositionResponse {
  int get id;
  @JsonKey(name: 'abstract_category')
  int? get abstractCategory;
  int? get category;
  String get name;
  int? get odflg;

  /// Create a copy of RosterPositionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RosterPositionResponseCopyWith<RosterPositionResponse> get copyWith =>
      _$RosterPositionResponseCopyWithImpl<RosterPositionResponse>(
          this as RosterPositionResponse, _$identity);

  /// Serializes this RosterPositionResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RosterPositionResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.abstractCategory, abstractCategory) ||
                other.abstractCategory == abstractCategory) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.odflg, odflg) || other.odflg == odflg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, abstractCategory, category, name, odflg);

  @override
  String toString() {
    return 'RosterPositionResponse(id: $id, abstractCategory: $abstractCategory, category: $category, name: $name, odflg: $odflg)';
  }
}

/// @nodoc
abstract mixin class $RosterPositionResponseCopyWith<$Res> {
  factory $RosterPositionResponseCopyWith(RosterPositionResponse value,
          $Res Function(RosterPositionResponse) _then) =
      _$RosterPositionResponseCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'abstract_category') int? abstractCategory,
      int? category,
      String name,
      int? odflg});
}

/// @nodoc
class _$RosterPositionResponseCopyWithImpl<$Res>
    implements $RosterPositionResponseCopyWith<$Res> {
  _$RosterPositionResponseCopyWithImpl(this._self, this._then);

  final RosterPositionResponse _self;
  final $Res Function(RosterPositionResponse) _then;

  /// Create a copy of RosterPositionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? abstractCategory = freezed,
    Object? category = freezed,
    Object? name = null,
    Object? odflg = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      abstractCategory: freezed == abstractCategory
          ? _self.abstractCategory
          : abstractCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      odflg: freezed == odflg
          ? _self.odflg
          : odflg // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RosterPositionResponse].
extension RosterPositionResponsePatterns on RosterPositionResponse {
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
    TResult Function(_RosterPositionResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RosterPositionResponse() when $default != null:
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
    TResult Function(_RosterPositionResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterPositionResponse():
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
    TResult? Function(_RosterPositionResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterPositionResponse() when $default != null:
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
            @JsonKey(name: 'abstract_category') int? abstractCategory,
            int? category,
            String name,
            int? odflg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RosterPositionResponse() when $default != null:
        return $default(_that.id, _that.abstractCategory, _that.category,
            _that.name, _that.odflg);
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
            @JsonKey(name: 'abstract_category') int? abstractCategory,
            int? category,
            String name,
            int? odflg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterPositionResponse():
        return $default(_that.id, _that.abstractCategory, _that.category,
            _that.name, _that.odflg);
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
            @JsonKey(name: 'abstract_category') int? abstractCategory,
            int? category,
            String name,
            int? odflg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RosterPositionResponse() when $default != null:
        return $default(_that.id, _that.abstractCategory, _that.category,
            _that.name, _that.odflg);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RosterPositionResponse implements RosterPositionResponse {
  const _RosterPositionResponse(
      {required this.id,
      @JsonKey(name: 'abstract_category') this.abstractCategory,
      this.category,
      required this.name,
      this.odflg});
  factory _RosterPositionResponse.fromJson(Map<String, dynamic> json) =>
      _$RosterPositionResponseFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'abstract_category')
  final int? abstractCategory;
  @override
  final int? category;
  @override
  final String name;
  @override
  final int? odflg;

  /// Create a copy of RosterPositionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RosterPositionResponseCopyWith<_RosterPositionResponse> get copyWith =>
      __$RosterPositionResponseCopyWithImpl<_RosterPositionResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RosterPositionResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RosterPositionResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.abstractCategory, abstractCategory) ||
                other.abstractCategory == abstractCategory) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.odflg, odflg) || other.odflg == odflg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, abstractCategory, category, name, odflg);

  @override
  String toString() {
    return 'RosterPositionResponse(id: $id, abstractCategory: $abstractCategory, category: $category, name: $name, odflg: $odflg)';
  }
}

/// @nodoc
abstract mixin class _$RosterPositionResponseCopyWith<$Res>
    implements $RosterPositionResponseCopyWith<$Res> {
  factory _$RosterPositionResponseCopyWith(_RosterPositionResponse value,
          $Res Function(_RosterPositionResponse) _then) =
      __$RosterPositionResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'abstract_category') int? abstractCategory,
      int? category,
      String name,
      int? odflg});
}

/// @nodoc
class __$RosterPositionResponseCopyWithImpl<$Res>
    implements _$RosterPositionResponseCopyWith<$Res> {
  __$RosterPositionResponseCopyWithImpl(this._self, this._then);

  final _RosterPositionResponse _self;
  final $Res Function(_RosterPositionResponse) _then;

  /// Create a copy of RosterPositionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? abstractCategory = freezed,
    Object? category = freezed,
    Object? name = null,
    Object? odflg = freezed,
  }) {
    return _then(_RosterPositionResponse(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      abstractCategory: freezed == abstractCategory
          ? _self.abstractCategory
          : abstractCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      odflg: freezed == odflg
          ? _self.odflg
          : odflg // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
