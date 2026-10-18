import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_response.freezed.dart';
part 'team_response.g.dart';

/// チーム検索のAPIレスポンス型
@freezed
abstract class TeamResponse with _$TeamResponse {
  const factory TeamResponse({
    required int id,
    required String city,
    required String name,
    String? conference,
    String? area,
    @JsonKey(name: 'image_file') String? imageFile,
    @JsonKey(name: 'back_image_file') String? backImageFile,
  }) = _TeamResponse;

  factory TeamResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamResponseFromJson(json);
}
