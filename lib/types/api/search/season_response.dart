import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_response.freezed.dart';
part 'season_response.g.dart';

/// シーズン検索のAPIレスポンス型
@freezed
abstract class SeasonResponse with _$SeasonResponse {
  const factory SeasonResponse({
    required int season,
  }) = _SeasonResponse;

  factory SeasonResponse.fromJson(Map<String, dynamic> json) =>
      _$SeasonResponseFromJson(json);
}
