import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/providers/components/loading/loading_provider.dart';

/// ローディング中に画面全体を覆い、操作をブロックするオーバーレイ
class LoadingOverlay extends ConsumerWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(loadingProvider);

    if (!loadingState.isLoading) {
      return const SizedBox.shrink();
    }

    return ColoredBox(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(color: Colors.white),
            if (loadingState.message != null) ...[
              const SizedBox(height: 16),
              Text(
                loadingState.message!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
            if (loadingState.action != null) ...[
              const SizedBox(height: 8),
              Text(
                loadingState.action!,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
