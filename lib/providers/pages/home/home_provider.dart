import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/providers/pages/home/home_state.dart';
import 'package:nfl_library_app/types/domain/roster_player.dart';
import 'package:nfl_library_app/types/ui/i_select_box.dart';

/// ホーム画面の状態を管理するNotifier
/// API呼び出し・データ整形は HomeScreenController が担当し、ここでは State の更新のみを行う
class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() => const HomeStateInitial();

  /// 初期データ取得完了時の State をセット
  void setLoaded({
    required List<ISelectBox<int>> seasons,
    required List<ISelectBox<int>> teams,
    required int selectedSeason,
    required int selectedTeam,
    required List<RosterPlayer> players,
  }) {
    state = HomeStateLoaded(
      seasons: seasons,
      teams: teams,
      selectedSeason: selectedSeason,
      selectedTeam: selectedTeam,
      players: players,
    );
  }

  /// 選択シーズン・チーム・検索キーワードと選手一覧を更新
  void setPlayers({
    int? selectedSeason,
    int? selectedTeam,
    List<String>? searchNames,
    required List<RosterPlayer> players,
  }) {
    final currentState = state;
    if (currentState is! HomeStateLoaded) return;

    state = currentState.copyWith(
      selectedSeason: selectedSeason,
      selectedTeam: selectedTeam,
      searchNames: searchNames,
      players: players,
    );
  }

  /// エラー状態をセット
  void setError(String message) {
    state = HomeStateError(message: message);
  }
}

/// ホーム画面のProvider（画面離脱時に破棄）
final homeProvider = NotifierProvider.autoDispose<HomeNotifier, HomeState>(
  HomeNotifier.new,
);
