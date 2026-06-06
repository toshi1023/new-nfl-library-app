# screens/ の構成ガイド

## 役割

UI描画のみを担当する層。ビジネスロジックは持たず、Providerの状態を監視して描画を切り替える。

## フォルダ構成

```
screens/
├── components/    # 再利用可能なコンポーネント
│   ├── bars/      #   └ AppBar、BottomNavBar
│   ├── buttons/   #   └ ボタン
│   ├── forms/     #   └ 入力フォーム、セレクトボックス
│   ├── loading/   #   └ ローディングオーバーレイ
│   ├── logos/     #   └ ロゴ
│   └── tags/      #   └ タグ、チップ
└── pages/         # ページ
```

## Widget の使い分け

| Widget | 用途 |
|--------|------|
| `ConsumerWidget` | Providerの状態を監視するページ・コンポーネント（基本はこれを使う） |
| `ConsumerStatefulWidget` | Provider監視 + ローカルState（AnimationController等）が必要な場合 |
| `StatelessWidget` | Provider不要のシンプルなコンポーネント |

## ページの基本実装パターン

### sealed class + switch による State 分岐

ページは Provider の状態を `ref.watch()` で監視し、`sealed class` の `switch` 式で描画を切り替える。
`sealed class` を使うことで、コンパイル時に全状態の網羅チェックが行われ、状態の追加漏れを防げる。

#### 対応する State の定義（providers/ 側）

```dart
/// sealed class で状態を定義
sealed class PlayerState {
  const PlayerState();
}

/// 初期状態
class PlayerStateInitial extends PlayerState {
  const PlayerStateInitial();
}

/// ローディング中
class PlayerStateLoading extends PlayerState {
  const PlayerStateLoading();
}

/// 正常取得完了
class PlayerStateLoaded extends PlayerState {
  final List<Player> players;
  const PlayerStateLoaded({required this.players});
}

/// エラー
class PlayerStateError extends PlayerState {
  final String message;
  const PlayerStateError({required this.message});
}
```

#### Screen での描画切り替え

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/providers/domains/player/player_provider.dart';
import 'package:nfl_library_app/controllers/pages/player_search_controller.dart';
import 'package:nfl_library_app/utils/loading_helper.dart';
import 'package:nfl_library_app/utils/common_function.dart';

class PlayerSearchScreen extends ConsumerWidget {
  const PlayerSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(playerProvider);

    return Scaffold(
      appBar: const CustomAppMainBar(),
      // switch 式で全状態を網羅（漏れがあるとコンパイルエラー）
      body: switch (state) {
        PlayerStateInitial() =>
          _buildInitialView(context, ref),
        PlayerStateLoading() =>
          const Center(child: CircularProgressIndicator()),
        PlayerStateLoaded(:final players) =>
          players.isEmpty
            ? const Center(child: Text('データが見つかりません'))
            : _buildPlayerList(players),
        PlayerStateError(:final message) =>
          _buildErrorView(context, ref, message),
      },
    );
  }

  /// 初期表示
  Widget _buildInitialView(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _onSearch(context, ref),
        child: const Text('検索'),
      ),
    );
  }

  /// エラー表示（再試行ボタン付き）
  Widget _buildErrorView(BuildContext context, WidgetRef ref, String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _onSearch(context, ref),
            child: const Text('再試行'),
          ),
        ],
      ),
    );
  }

  /// 検索実行
  Future<void> _onSearch(BuildContext context, WidgetRef ref) async {
    final controller = PlayerSearchController(ref);

    try {
      await LoadingHelper.withLoading(ref, () async {
        await controller.fetchPlayers(seasonYear: 2024, teamId: 1);
      }, message: '選手データを取得中...');
    } catch (e) {
      if (context.mounted) {
        CommonFunctions.showErrorSnackBar(context, e.toString());
      }
    }
  }

  /// 選手一覧の描画
  Widget _buildPlayerList(List<Player> players) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return ListTile(
          title: Text(player.name),
          subtitle: Text(player.position),
        );
      },
    );
  }
}
```

### if-null 分岐ではなく switch を使う理由

| 比較 | `if (state.xxx == null)` 分岐 | `sealed class` + `switch` |
|------|-------------------------------|---------------------------|
| 網羅チェック | なし（状態追加時に漏れる） | コンパイル時にエラーで検知 |
| 各状態のデータ | 1クラスに全フィールドを nullable で持つ | 状態ごとに必要なフィールドだけ持つ |
| 可読性 | `null` チェックの連鎖 | 状態が明示的で意図が明確 |

## コンポーネントの基本実装パターン

### コールバック方式

コンポーネントは状態を直接操作せず、コールバックで親に通知する。

```dart
class CustomSearchInput extends StatefulWidget {
  final String label;
  final void Function(String) callback;

  const CustomSearchInput({
    super.key,
    required this.label,
    required this.callback,
  });

  // ...
}
```

### 既存コンポーネント一覧

| コンポーネント | ファイル | 用途 |
|--------------|---------|------|
| `CustomAppMainBar` | `bars/custom_app_main_bar.dart` | アプリ共通AppBar |
| `CustomBottomNavBar` | `bars/custom_bottom_nav_bar.dart` | ボトムナビゲーション |
| `CustomButton` | `buttons/custom_button.dart` | 汎用ボタン（solid/outline/disabled） |
| `CustomSearchInput` | `forms/custom_search_input.dart` | 検索入力欄 |
| `CustomSelectBox<T>` | `forms/custom_select_box.dart` | プルダウン選択（BottomSheet） |
| `LoadingOverlay` | `loading/loading_overlay.dart` | 全画面ローディング |
| `CustomAppLogo` | `logos/custom_app_logo.dart` | アプリロゴ |
| `CustomTag` | `tags/custom_tag.dart` | 削除可能タグ |
| `CustomSelectTag<T>` | `tags/custom_select_tag.dart` | 選択式タグ（展開アニメーション付き） |

実装時は既存コンポーネントを確認し、該当するものがあれば再利用すること。

## 設計ルール

| ルール | 説明 |
|--------|------|
| UI描画のみ | ビジネスロジック・API呼び出し・データ整形は行わない |
| State に応じて描画を切り替える | 初期状態 / ローディング / 正常取得 / エラー / データ空 を分岐する |
| ローディングは `LoadingHelper` を使う | 画面個別のローディング実装はしない |
| エラー通知は `CommonFunctions` を使う | SnackBar 表示は utils の共通処理を利用する |
| コンポーネントはコールバック方式 | 子から親への通知はコールバック関数で行う |
| `context.mounted` チェック | 非同期処理後に `context` を使う場合は必ず `mounted` を確認する |

## 命名規則

| 対象 | 規則 | 例 |
|------|------|-----|
| ページ | `{画面名}_screen.dart` | `player_search_screen.dart` |
| コンポーネント | `custom_{機能名}.dart` | `custom_button.dart` |
| ページクラス | `{画面名}Screen` | `PlayerSearchScreen` |
| コンポーネントクラス | `Custom{機能名}` | `CustomButton` |
| プライベート描画メソッド | `_build{要素名}` | `_buildPlayerList()`, `_buildBody()` |
| イベントハンドラ | `_on{アクション名}` | `_onSearch()`, `_onRetry()` |
