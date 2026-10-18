import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/search/season_response.dart';
import 'package:nfl_library_app/types/api/search/team_response.dart';
import 'package:nfl_library_app/repositories/base_repository_impl.dart';
import 'package:nfl_library_app/repositories/search/search_repository.dart';

/// 検索リポジトリの実装
class SearchRepositoryImpl extends BaseRepositoryImpl
    implements SearchRepository {
  @override
  Future<ApiResult<List<SeasonResponse>>> getSeasons() async {
    return get(
      '/api/v1/search/seasons',
      fromJson: (data) =>
          ((data as Map<String, dynamic>)['seasons'] as List)
              .map((e) => SeasonResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  @override
  Future<ApiResult<List<TeamResponse>>> getTeams() async {
    return get(
      '/api/v1/search/teams',
      fromJson: (data) =>
          ((data as Map<String, dynamic>)['teams'] as List)
              .map((e) => TeamResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}
