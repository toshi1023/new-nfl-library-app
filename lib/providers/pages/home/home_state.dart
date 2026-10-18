import 'package:nfl_library_app/types/domain/roster_player.dart';
import 'package:nfl_library_app/types/ui/i_select_box.dart';

/// ホーム画面の状態を管理するsealed class
sealed class HomeState {
  const HomeState();
}

/// 初期状態
class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

/// ローディング中
class HomeStateLoading extends HomeState {
  const HomeStateLoading();
}

/// 正常取得完了
class HomeStateLoaded extends HomeState {
  final List<ISelectBox<int>> seasons;
  final List<ISelectBox<int>> teams;
  final int selectedSeason;
  final int selectedTeam;
  final List<RosterPlayer> players;

  /// 選手名の検索キーワード（OR 条件。空の場合は絞り込みなし）
  final List<String> searchNames;

  const HomeStateLoaded({
    required this.seasons,
    required this.teams,
    required this.selectedSeason,
    required this.selectedTeam,
    required this.players,
    this.searchNames = const [],
  });

  /// 一部のフィールドだけ更新したコピーを返す
  HomeStateLoaded copyWith({
    List<ISelectBox<int>>? seasons,
    List<ISelectBox<int>>? teams,
    int? selectedSeason,
    int? selectedTeam,
    List<RosterPlayer>? players,
    List<String>? searchNames,
  }) {
    return HomeStateLoaded(
      seasons: seasons ?? this.seasons,
      teams: teams ?? this.teams,
      selectedSeason: selectedSeason ?? this.selectedSeason,
      selectedTeam: selectedTeam ?? this.selectedTeam,
      players: players ?? this.players,
      searchNames: searchNames ?? this.searchNames,
    );
  }
}

/// エラー
class HomeStateError extends HomeState {
  final String message;
  const HomeStateError({required this.message});
}
