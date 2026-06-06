# controllers/ の構成ガイド

## 役割

APIとUIの中継役となるビジネスロジック層。
Repositoryを通じてAPIを呼び出し、レスポンスを `types/domain/` のドメインモデルに整形し、Notifierを介してStateを更新する。

## フォルダ構成

```
controllers/
├── components/    # コンポーネント用コントローラー
└── pages/         # ページ用コントローラー
```

## 処理フロー

```
Screen（UIイベント発火）
  ↓ Controller のメソッド呼び出し
Controller
  ↓ Repository 経由で API 呼び出し
Repository（HTTP通信）
  ↓ types/api/ の Response を返す
Controller
  ↓ Response → types/domain/ のドメインモデルに整形
  ↓ Notifier を介して State を更新
  ↓ 整形した domain モデルを返す
Screen（UIに反映）
```

## 基本実装パターン

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/repositories/player_repository.dart';
import 'package:nfl_library_app/providers/domains/player/player_provider.dart';
import 'package:nfl_library_app/types/domain/player.dart';

class PlayerController {
  final WidgetRef _ref;
  final PlayerRepository _repository;

  PlayerController(this._ref)
      : _repository = PlayerRepository();

  /// 選手一覧を取得し、Stateを更新して返す
  Future<List<Player>> fetchPlayers({
    required int seasonYear,
    required int teamId,
  }) async {
    // 1. Repository 経由で API 呼び出し
    final response = await _repository.getPlayers(
      seasonYear: seasonYear,
      teamId: teamId,
    );

    // 2. Response → domain モデルに整形
    final players = response.map((e) => Player(
      id: e.id,
      name: e.name,
      position: e.position,
      teamName: e.teamName,
      teamLogoPath: 'assets/images/logos/${e.teamKey}.gif',
    )).toList();

    // 3. Notifier を介して State を更新
    _ref.read(playerProvider.notifier).setPlayers(players);

    // 4. 整形した domain モデルを返す
    return players;
  }
}
```

## 設計ルール

| ルール | 説明 |
|--------|------|
| 戻り値は `types/domain/` の型 | APIレスポンス（`types/api/`）をそのまま返さない。必ずドメインモデルに変換する |
| APIは必ず Repository 経由 | Controller 内で直接 HTTP 通信を行わない |
| State 更新は Notifier 経由 | Controller 内で `state =` を直接操作せず、Notifier のメソッドを呼ぶ |
| UI ロジックは持たない | SnackBar表示やナビゲーションなど UI 操作は Screen 側で行う |
| 共通処理は utils を利用 | ローディング制御やログ出力など、utils に定義済みの処理を使う |

## 命名規則

| 対象 | 規則 | 例 |
|------|------|-----|
| ファイル名 | `{画面名}_controller.dart` | `player_search_controller.dart` |
| クラス名 | `{画面名}Controller` | `PlayerSearchController` |
| メソッド名 | 処理内容を表す動詞始まり | `fetchPlayers()`, `updateFavorite()` |

## Screen からの利用

```dart
class PlayerSearchScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final controller = PlayerSearchController(ref);

        // ローディング付きで API 呼び出し
        final players = await LoadingHelper.withLoading(ref, () async {
          return await controller.fetchPlayers(
            seasonYear: 2024,
            teamId: 1,
          );
        }, message: '選手データを取得中...');

        // UI ロジックは Screen 側で処理
        if (players.isEmpty) {
          CommonFunctions.showSnackBar(context, 'データが見つかりません');
        }
      },
      child: const Text('検索'),
    );
  }
}
```
