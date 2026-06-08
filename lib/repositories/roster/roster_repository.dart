import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/roster/roster_response.dart';

/// ロスターリポジトリのinterface
abstract class RosterRepository {
  /// 選手ロスター情報を取得
  Future<ApiResult<List<RosterResponse>>> getPlayersInfo({
    required int season,
    required int teamId,
  });
}
