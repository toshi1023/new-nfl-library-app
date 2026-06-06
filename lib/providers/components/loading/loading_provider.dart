import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/providers/components/loading/loading_state.dart';

/// ローディング状態を管理するNotifier
class LoadingNotifier extends Notifier<LoadingState> {
  @override
  LoadingState build() => const LoadingState();

  /// ローディング開始
  void startLoading({String? message, String? action}) {
    state = LoadingState(
      isLoading: true,
      message: message,
      action: action,
    );
  }

  /// ローディング終了
  void stopLoading() {
    state = const LoadingState();
  }
}

/// ローディング状態のProvider
final loadingProvider = NotifierProvider<LoadingNotifier, LoadingState>(
  LoadingNotifier.new,
);
