import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/search/season_response.dart';
import 'package:nfl_library_app/types/api/search/team_response.dart';

/// 検索リポジトリのinterface
abstract class SearchRepository {
  /// シーズン一覧を取得
  /// GET /api/v1/search/seasons
  Future<ApiResult<List<SeasonResponse>>> getSeasons();

  /// チーム一覧を取得
  /// GET /api/v1/search/teams
  Future<ApiResult<List<TeamResponse>>> getTeams();
}
