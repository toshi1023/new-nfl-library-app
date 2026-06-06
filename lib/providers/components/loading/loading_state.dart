/// ローディングの状態を管理するクラス
class LoadingState {
  final bool isLoading;
  final String? message;
  final String? action;

  const LoadingState({
    this.isLoading = false,
    this.message,
    this.action,
  });

  LoadingState copyWith({
    bool? isLoading,
    String? message,
    String? action,
  }) {
    return LoadingState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      action: action ?? this.action,
    );
  }
}
