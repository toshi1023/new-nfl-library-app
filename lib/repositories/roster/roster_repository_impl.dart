import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/roster/roster_response.dart';
import 'package:nfl_library_app/types/api/roster/roster_sort.dart';
import 'package:nfl_library_app/repositories/base_repository_impl.dart';
import 'package:nfl_library_app/repositories/roster/roster_repository.dart';

/// ロスターリポジトリの実装
class RosterRepositoryImpl extends BaseRepositoryImpl
    implements RosterRepository {
  RosterRepositoryImpl({super.dio});

  @override
  Future<ApiResult<List<RosterResponse>>> getRosters({
    required int season,
    required int teamId,
    List<String> names = const [],
    RosterSortBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    return get(
      '/api/v1/rosters',
      queryParameters: {
        'season': season,
        'team_id': teamId,
        // リストは name=Josh&name=Allen の繰り返し形式で送られる
        if (names.isNotEmpty) 'name': names,
        if (sortBy != null) 'sort_by': sortBy.name,
        if (sortOrder != null) 'sort_order': sortOrder.name,
      },
      fromJson: (data) =>
          ((data as Map<String, dynamic>)['rosters'] as List)
              .map((e) => RosterResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}
