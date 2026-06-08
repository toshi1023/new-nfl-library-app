import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/providers/pages/home/home_state.dart';
import 'package:nfl_library_app/types/domain/roster_player.dart';

/// ホーム画面の状態を管理するNotifier
class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() => const HomeStateInitial();

  /// 選手一覧をセット
  void setPlayers(List<RosterPlayer> players) {
    state = HomeStateLoaded(players: players);
  }

  /// エラー状態をセット
  void setError(String message) {
    state = HomeStateError(message: message);
  }

  /// ローディング状態をセット
  void setLoading() {
    state = const HomeStateLoading();
  }

  /// 初期状態にリセット
  void reset() {
    state = const HomeStateInitial();
  }
}

/// ホーム画面のProvider
final homeProvider = NotifierProvider<HomeNotifier, HomeState>(
  HomeNotifier.new,
);
