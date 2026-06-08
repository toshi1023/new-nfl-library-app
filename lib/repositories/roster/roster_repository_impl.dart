import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/roster/roster_response.dart';
import 'package:nfl_library_app/repositories/base_repository_impl.dart';
import 'package:nfl_library_app/repositories/roster/roster_repository.dart';

/// ロスターリポジトリの実装
class RosterRepositoryImpl extends BaseRepositoryImpl
    implements RosterRepository {
  @override
  Future<ApiResult<List<RosterResponse>>> getPlayersInfo({
    required int season,
    required int teamId,
  }) async {
    return get(
      '/api/players/info',
      queryParameters: {'season': season, 'team_id': teamId},
      fromJson: (data) =>
          ((data as Map<String, dynamic>)['rosters'] as List)
              .map((e) => RosterResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}
