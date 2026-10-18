import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/roster/roster_response.dart';
import 'package:nfl_library_app/types/api/roster/roster_sort.dart';

/// ロスターリポジトリのinterface
abstract class RosterRepository {
  /// シーズン・チーム・選手名で絞り込んでロスター一覧を取得
  /// GET /api/v1/rosters
  /// [names] は firstname・lastname の部分一致で、複数指定時は OR 条件（空の場合は絞り込まない）
  /// [sortBy] / [sortOrder] は未指定の場合サーバー側の既定値（rating / desc）になる
  Future<ApiResult<List<RosterResponse>>> getRosters({
    required int season,
    required int teamId,
    List<String> names = const [],
    RosterSortBy? sortBy,
    SortOrder? sortOrder,
  });
}
