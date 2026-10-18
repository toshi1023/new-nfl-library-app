import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/providers/pages/home/home_provider.dart';
import 'package:nfl_library_app/providers/pages/home/home_state.dart';
import 'package:nfl_library_app/repositories/roster/roster_repository.dart';
import 'package:nfl_library_app/repositories/roster/roster_repository_impl.dart';
import 'package:nfl_library_app/repositories/search/search_repository.dart';
import 'package:nfl_library_app/repositories/search/search_repository_impl.dart';
import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/roster/roster_response.dart';
import 'package:nfl_library_app/types/api/search/season_response.dart';
import 'package:nfl_library_app/types/api/search/team_response.dart';
import 'package:nfl_library_app/types/domain/roster_player.dart';
import 'package:nfl_library_app/types/ui/i_select_box.dart';
import 'package:nfl_library_app/utils/validation_error_helper.dart';

/// ホーム画面のコントローラー
class HomeScreenController {
  final WidgetRef _ref;
  final SearchRepository _searchRepository;
  final RosterRepository _rosterRepository;

  HomeScreenController(
    this._ref, {
    SearchRepository? searchRepository,
    RosterRepository? rosterRepository,
  })  : _searchRepository = searchRepository ?? SearchRepositoryImpl(),
        _rosterRepository = rosterRepository ?? RosterRepositoryImpl();

  /// 初期化：シーズン/チームリスト取得 + 初期値で選手データ取得
  /// 取得に失敗した場合はエラー状態をセットし、例外を投げる
  Future<void> initialize() async {
    final notifier = _ref.read(homeProvider.notifier);

    try {
      final seasons = _toSeasonSelectList(
        _unwrap(await _searchRepository.getSeasons()),
      );
      final teams = _toTeamSelectList(
        _unwrap(await _searchRepository.getTeams()),
      );

      if (seasons.isEmpty || teams.isEmpty) {
        throw Exception('シーズンまたはチームデータが空です');
      }

      final initialSeason = seasons.first.value;
      final initialTeam = teams.first.value;
      final players = await fetchPlayers(
        season: initialSeason,
        teamId: initialTeam,
      );

      notifier.setLoaded(
        seasons: seasons,
        teams: teams,
        selectedSeason: initialSeason,
        selectedTeam: initialTeam,
        players: players,
      );
    } catch (e) {
      notifier.setError(e.toString().replaceFirst('Exception: ', ''));
      rethrow;
    }
  }

  /// シーズン変更
  /// 取得に失敗した場合は表示中の一覧を維持したまま例外を投げる
  Future<List<RosterPlayer>> changeSeason(int season) async {
    final currentState = _ref.read(homeProvider);
    if (currentState is! HomeStateLoaded) return [];

    final players = await fetchPlayers(
      season: season,
      teamId: currentState.selectedTeam,
      names: currentState.searchNames,
    );
    _ref.read(homeProvider.notifier).setPlayers(
          selectedSeason: season,
          players: players,
        );
    return players;
  }

  /// チーム変更
  /// 取得に失敗した場合は表示中の一覧を維持したまま例外を投げる
  Future<List<RosterPlayer>> changeTeam(int teamId) async {
    final currentState = _ref.read(homeProvider);
    if (currentState is! HomeStateLoaded) return [];

    final players = await fetchPlayers(
      season: currentState.selectedSeason,
      teamId: teamId,
      names: currentState.searchNames,
    );
    _ref.read(homeProvider.notifier).setPlayers(
          selectedTeam: teamId,
          players: players,
        );
    return players;
  }

  /// 選手名の検索キーワードを追加して検索（登録済みのキーワードは追加しない）
  /// 取得に失敗した場合は表示中の一覧を維持したまま例外を投げる
  Future<List<RosterPlayer>> addSearchName(String name) async {
    final currentState = _ref.read(homeProvider);
    if (currentState is! HomeStateLoaded) return [];
    if (currentState.searchNames.contains(name)) return currentState.players;

    return _searchByNames([...currentState.searchNames, name]);
  }

  /// 選手名の検索キーワードを除外して検索
  /// 取得に失敗した場合は表示中の一覧を維持したまま例外を投げる
  Future<List<RosterPlayer>> removeSearchName(String name) async {
    final currentState = _ref.read(homeProvider);
    if (currentState is! HomeStateLoaded) return [];

    return _searchByNames(
      currentState.searchNames.where((n) => n != name).toList(),
    );
  }

  /// 指定した検索キーワードで選手一覧を取得し、State に反映する
  Future<List<RosterPlayer>> _searchByNames(List<String> names) async {
    final currentState = _ref.read(homeProvider);
    if (currentState is! HomeStateLoaded) return [];

    final players = await fetchPlayers(
      season: currentState.selectedSeason,
      teamId: currentState.selectedTeam,
      names: names,
    );
    _ref.read(homeProvider.notifier).setPlayers(
          searchNames: names,
          players: players,
        );
    return players;
  }

  /// ロスターAPIから選手一覧を取得し、ドメインモデルに変換して返す
  Future<List<RosterPlayer>> fetchPlayers({
    required int season,
    required int teamId,
    List<String> names = const [],
  }) async {
    final rosters = _unwrap(
      await _rosterRepository.getRosters(
        season: season,
        teamId: teamId,
        names: names,
      ),
    );
    return rosters.map((roster) => _toRosterPlayer(roster, season)).toList();
  }

  /// ApiResult から成功時のデータを取り出す。エラー時は例外を投げる
  T _unwrap<T>(ApiResult<T> result) {
    return switch (result) {
      ApiSuccess(:final data) => data,
      ApiError(:final message) => throw Exception(message),
      ApiValidationError(:final message, :final errors) => throw Exception(
          errors.isEmpty
              ? message
              : ValidationErrorHelper.errorsToString(errors),
        ),
    };
  }

  /// シーズン一覧をセレクトボックス用に変換
  List<ISelectBox<int>> _toSeasonSelectList(List<SeasonResponse> seasons) {
    return seasons.map((s) {
      return ISelectBox<int>(
        value: s.season,
        text: '${s.season}年',
        shortText: '${s.season}年',
      );
    }).toList();
  }

  /// チーム一覧をセレクトボックス用に変換
  List<ISelectBox<int>> _toTeamSelectList(List<TeamResponse> teams) {
    return teams.map((t) {
      return ISelectBox<int>(
        value: t.id,
        text: '${t.city} ${t.name}',
        shortText: t.city,
        imageFile:
            t.imageFile != null ? 'assets/images/logos/${t.imageFile}' : null,
      );
    }).toList();
  }

  /// ロスターのAPIレスポンスを選手のドメインモデルに変換
  RosterPlayer _toRosterPlayer(RosterResponse roster, int season) {
    final player = roster.player;

    return RosterPlayer(
      id: player.id,
      firstName: player.firstname,
      lastName: player.lastname,
      age: _calculateAge(
        birthdayYear: player.birthdayYear,
        birthday: player.birthday,
        season: season,
      ),
      imageUrl: player.imageFile != null ? player.imageUrl : null,
      number: roster.number,
      rating: roster.rating,
      positionName: roster.position.name,
    );
  }

  /// 選択シーズン時点の年齢を計算
  /// birthday_year を優先し、無ければ誕生日文字列（"YYYYMMDD"）の先頭4桁を使う
  int _calculateAge({
    required int? birthdayYear,
    required String birthday,
    required int season,
  }) {
    final birthYear = birthdayYear ?? int.parse(birthday.substring(0, 4));
    return season - birthYear;
  }
}
