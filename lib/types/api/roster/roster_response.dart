import 'package:freezed_annotation/freezed_annotation.dart';

part 'roster_response.freezed.dart';
part 'roster_response.g.dart';

/// ロスター情報のAPIレスポンス型
@freezed
abstract class RosterResponse with _$RosterResponse {
  const factory RosterResponse({
    required int id,
    required int season,
    @JsonKey(name: 'team_id') required int teamId,
    @JsonKey(name: 'player_id') required int playerId,
    @JsonKey(name: 'position_id') required int positionId,
    required int number,
    int? rating,
    required int experience,
    required RosterPlayerResponse player,
    required RosterPositionResponse position,
  }) = _RosterResponse;

  factory RosterResponse.fromJson(Map<String, dynamic> json) =>
      _$RosterResponseFromJson(json);
}

/// ロスター内の選手情報
@freezed
abstract class RosterPlayerResponse with _$RosterPlayerResponse {
  const factory RosterPlayerResponse({
    required int id,
    required String firstname,
    required String lastname,
    required String birthday,
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
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _RosterPlayerResponse;

  factory RosterPlayerResponse.fromJson(Map<String, dynamic> json) =>
      _$RosterPlayerResponseFromJson(json);
}

/// ロスター内のポジション情報
@freezed
abstract class RosterPositionResponse with _$RosterPositionResponse {
  const factory RosterPositionResponse({
    required int id,
    @JsonKey(name: 'abstract_category') int? abstractCategory,
    int? category,
    required String name,
    int? odflg,
  }) = _RosterPositionResponse;

  factory RosterPositionResponse.fromJson(Map<String, dynamic> json) =>
      _$RosterPositionResponseFromJson(json);
}
