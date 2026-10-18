// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamResponse _$TeamResponseFromJson(Map<String, dynamic> json) =>
    _TeamResponse(
      id: (json['id'] as num).toInt(),
      city: json['city'] as String,
      name: json['name'] as String,
      conference: json['conference'] as String?,
      area: json['area'] as String?,
      imageFile: json['image_file'] as String?,
      backImageFile: json['back_image_file'] as String?,
    );

Map<String, dynamic> _$TeamResponseToJson(_TeamResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'name': instance.name,
      'conference': instance.conference,
      'area': instance.area,
      'image_file': instance.imageFile,
      'back_image_file': instance.backImageFile,
    };
