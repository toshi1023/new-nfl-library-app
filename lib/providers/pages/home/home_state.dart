import 'package:nfl_library_app/types/domain/roster_player.dart';

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
  final List<RosterPlayer> players;
  const HomeStateLoaded({required this.players});
}

/// エラー
class HomeStateError extends HomeState {
  final String message;
  const HomeStateError({required this.message});
}
