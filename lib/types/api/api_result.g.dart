// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSuccess<T> _$ApiSuccessFromJson<T>(Map<String, dynamic> json) =>
    ApiSuccess<T>(
      message: json['message'] as String,
      data: _dataFromJson(json['data']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ApiSuccessToJson<T>(ApiSuccess<T> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': _dataToJson(instance.data),
      'runtimeType': instance.$type,
    };

ApiError<T> _$ApiErrorFromJson<T>(Map<String, dynamic> json) => ApiError<T>(
      message: json['message'] as String,
      error: json['error'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ApiErrorToJson<T>(ApiError<T> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'runtimeType': instance.$type,
    };

ApiValidationError<T> _$ApiValidationErrorFromJson<T>(
        Map<String, dynamic> json) =>
    ApiValidationError<T>(
      message: json['message'] as String,
      errors: _errorsFromJson(json['errors']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ApiValidationErrorToJson<T>(
        ApiValidationError<T> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': _errorsToJson(instance.errors),
      'runtimeType': instance.$type,
    };
