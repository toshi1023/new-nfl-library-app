import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/providers/pages/home/home_provider.dart';
import 'package:nfl_library_app/repositories/roster/roster_repository_impl.dart';
import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/domain/roster_player.dart';
import 'package:nfl_library_app/types/ui/i_select_box.dart';

/// ホーム画面のコントローラー
class HomeScreenController {
  final WidgetRef _ref;
  final RosterRepositoryImpl _repository;

  HomeScreenController(this._ref) : _repository = RosterRepositoryImpl();

  /// シーズン情報を取得
  Future<List<ISelectBox<int>>> fetchSeasonList() async {
    return [
      ISelectBox<int>(value: 2012, text: '2012年', shortText: '2012年'),
      ISelectBox<int>(value: 2013, text: '2013年', shortText: '2013年'),
      ISelectBox<int>(value: 2014, text: '2014年', shortText: '2014年'),
    ];
  }

  /// チーム情報を取得
  Future<List<ISelectBox<int>>> fetchTeamList() async {
    return [
      ISelectBox<int>(value: 1, text: 'San Francisco 49ers', shortText: 'San Francisco', imageFile: 'assets/images/logos/49ers.gif'),
      ISelectBox<int>(value: 2, text: 'Kansas City Chiefs', shortText: 'Kansas City', imageFile: 'assets/images/logos/chiefs.gif'),
      ISelectBox<int>(value: 3, text: 'Green Bay Packers', shortText: 'Green Bay', imageFile: 'assets/images/logos/packers.gif'),
    ];
  }

  /// 選手ロスター情報を取得し、Stateを更新して返す
  Future<List<RosterPlayer>> fetchPlayersInfo({
    required int season,
    required int teamId,
  }) async {
    final result = await _repository.getPlayersInfo(
      season: season,
      teamId: teamId,
    );

    return switch (result) {
      ApiSuccess(:final data) => () {
        final players = data.map((roster) {
          final player = roster.player;
          final age = _calculateAge(player.birthday);

          return RosterPlayer(
            id: player.id,
            firstName: player.firstname,
            lastName: player.lastname,
            age: age,
            imageUrl: player.imageFile != null ? player.imageUrl : null,
            number: roster.number,
            rating: roster.rating,
            positionName: roster.position.name,
          );
        }).toList();

        _ref.read(homeProvider.notifier).setPlayers(players);
        return players;
      }(),
      ApiError(:final message) => () {
        _ref.read(homeProvider.notifier).setError(message);
        throw Exception(message);
      }(),
      ApiValidationError(:final message) => () {
        _ref.read(homeProvider.notifier).setError(message);
        throw Exception(message);
      }(),
    };
  }

  /// 誕生日文字列（"YYYYMMDD"）から年齢を計算
  int _calculateAge(String birthday) {
    final year = int.parse(birthday.substring(0, 4));
    final month = int.parse(birthday.substring(4, 6));
    final day = int.parse(birthday.substring(6, 8));
    final birthDate = DateTime(year, month, day);
    final now = DateTime.now();

    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
