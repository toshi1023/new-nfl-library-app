// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roster_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RosterResponse _$RosterResponseFromJson(Map<String, dynamic> json) =>
    _RosterResponse(
      id: (json['id'] as num).toInt(),
      season: (json['season'] as num).toInt(),
      teamId: (json['team_id'] as num).toInt(),
      playerId: (json['player_id'] as num).toInt(),
      positionId: (json['position_id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      rating: (json['rating'] as num?)?.toInt(),
      experience: (json['experience'] as num).toInt(),
      player:
          RosterPlayerResponse.fromJson(json['player'] as Map<String, dynamic>),
      position: RosterPositionResponse.fromJson(
          json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RosterResponseToJson(_RosterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'season': instance.season,
      'team_id': instance.teamId,
      'player_id': instance.playerId,
      'position_id': instance.positionId,
      'number': instance.number,
      'rating': instance.rating,
      'experience': instance.experience,
      'player': instance.player,
      'position': instance.position,
    };

_RosterPlayerResponse _$RosterPlayerResponseFromJson(
        Map<String, dynamic> json) =>
    _RosterPlayerResponse(
      id: (json['id'] as num).toInt(),
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      birthday: json['birthday'] as String,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      college: json['college'] as String?,
      draftedTeam: json['drafted_team'] as String?,
      draftedRound: json['drafted_round'] as String?,
      draftedRank: json['drafted_rank'] as String?,
      draftedYear: (json['drafted_year'] as num?)?.toInt(),
      imageFile: json['image_file'] as String?,
      birthdayYear: (json['birthday_year'] as num?)?.toInt(),
      birthdayDate: json['birthday_date'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$RosterPlayerResponseToJson(
        _RosterPlayerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'birthday': instance.birthday,
      'height': instance.height,
      'weight': instance.weight,
      'college': instance.college,
      'drafted_team': instance.draftedTeam,
      'drafted_round': instance.draftedRound,
      'drafted_rank': instance.draftedRank,
      'drafted_year': instance.draftedYear,
      'image_file': instance.imageFile,
      'birthday_year': instance.birthdayYear,
      'birthday_date': instance.birthdayDate,
      'image_url': instance.imageUrl,
    };

_RosterPositionResponse _$RosterPositionResponseFromJson(
        Map<String, dynamic> json) =>
    _RosterPositionResponse(
      id: (json['id'] as num).toInt(),
      abstractCategory: (json['abstract_category'] as num?)?.toInt(),
      category: (json['category'] as num?)?.toInt(),
      name: json['name'] as String,
      odflg: (json['odflg'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RosterPositionResponseToJson(
        _RosterPositionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'abstract_category': instance.abstractCategory,
      'category': instance.category,
      'name': instance.name,
      'odflg': instance.odflg,
    };
