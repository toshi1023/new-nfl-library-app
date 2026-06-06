import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/providers/components/loading/loading_provider.dart';

/// ローディング状態管理ヘルパー
class LoadingHelper {
  /// ローディング状態で非同期処理を実行
  static Future<T> withLoading<T>(
    WidgetRef ref,
    Future<T> Function() callback, {
    String? message,  // ローディングメッセージ
    String? action,  // ローディング2番目のメッセージ
  }) async {
    try {
      ref.read(loadingProvider.notifier).startLoading(
        message: message,
        action: action,
      );
      return await callback();
    } finally {
      ref.read(loadingProvider.notifier).stopLoading();
    }
  }

  /// ローディング開始
  static void startLoading(WidgetRef ref, {String? message, String? action}) {
    ref.read(loadingProvider.notifier).startLoading(
      message: message,
      action: action,
    );
  }

  /// ローディング終了
  static void stopLoading(WidgetRef ref) {
    ref.read(loadingProvider.notifier).stopLoading();
  }
}