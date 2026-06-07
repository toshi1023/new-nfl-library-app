# repositories/ の構成ガイド

## 役割

API呼び出しの責務のみを担う層。HTTP通信の実装を管理し、ビジネスロジックやデータ整形は一切行わない。
ドメイン（業務領域）ごとにinterfaceと実装クラスを定義し、抽象化する。

## フォルダ構成

ドメインごとにフォルダを分け、interface と実装クラスの2ファイルを配置する。

```
repositories/
├── player/
│   ├── player_repository.dart        # interface（抽象クラス）
│   └── player_repository_impl.dart   # 実装クラス
├── team/
│   ├── team_repository.dart
│   └── team_repository_impl.dart
└── season/
    ├── season_repository.dart
    └── season_repository_impl.dart
```

## ファイル構成ルール

| ファイル | 役割 | 命名規則 |
|---------|------|---------|
| `*_repository.dart` | interface（抽象クラス）— メソッドシグネチャのみ定義 | `{ドメイン名}_repository.dart` |
| `*_repository_impl.dart` | 実装クラス — HTTP通信の具体的な処理 | `{ドメイン名}_repository_impl.dart` |

## レスポンス型のルール

全てのメソッドの戻り値は `ApiResult<T>` でラップされた `types/api/` の型を返す。

```
Future<ApiResult<{types/api/ の Response型}>>
```

## 基本実装パターン

### interface（抽象クラス）

```dart
import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/player/player_response.dart';
import 'package:nfl_library_app/types/api/player/player_request.dart';

/// 選手リポジトリのinterface
abstract class PlayerRepository {
  /// 選手一覧を取得
  Future<ApiResult<List<PlayerResponse>>> getPlayers({
    required int seasonYear,
    required int teamId,
  });

  /// 選手詳細を取得
  Future<ApiResult<PlayerResponse>> getPlayerDetail({
    required int playerId,
  });

  /// 選手情報を更新
  Future<ApiResult<PlayerResponse>> updatePlayer({
    required PlayerRequest request,
  });
}
```

### 実装クラス

`BaseRepositoryImpl` を継承し、親クラスの `get` / `post` / `put` / `delete` / `patch` メソッドを呼び出す。
Dio のインスタンス管理・エラーハンドリングは全て `BaseRepositoryImpl` に集約されているため、ドメインリポジトリでは API パスと `fromJson` の変換処理だけを記述する。

```dart
import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/types/api/player/player_response.dart';
import 'package:nfl_library_app/types/api/player/player_request.dart';
import 'package:nfl_library_app/repositories/base_repository_impl.dart';
import 'package:nfl_library_app/repositories/player/player_repository.dart';

/// 選手リポジトリの実装
class PlayerRepositoryImpl extends BaseRepositoryImpl
    implements PlayerRepository {
  @override
  Future<ApiResult<List<PlayerResponse>>> getPlayers({
    required int seasonYear,
    required int teamId,
  }) async {
    return get(
      '/players',
      queryParameters: {'season': seasonYear, 'team': teamId},
      fromJson: (data) =>
          (data as List).map((e) => PlayerResponse.fromJson(e)).toList(),
    );
  }

  @override
  Future<ApiResult<PlayerResponse>> getPlayerDetail({
    required int playerId,
  }) async {
    return get(
      '/players/$playerId',
      fromJson: (data) => PlayerResponse.fromJson(data),
    );
  }

  @override
  Future<ApiResult<PlayerResponse>> updatePlayer({
    required PlayerRequest request,
  }) async {
    return put(
      '/players/${request.id}',
      data: request.toJson(),
      fromJson: (data) => PlayerResponse.fromJson(data),
    );
  }
}
```

## Controller からの利用

```dart
class PlayerController {
  final WidgetRef _ref;
  final PlayerRepository _repository;

  PlayerController(this._ref)
      : _repository = PlayerRepositoryImpl();

  Future<List<Player>> fetchPlayers({
    required int seasonYear,
    required int teamId,
  }) async {
    // Repository は ApiResult<types/api/ の型> を返す
    final result = await _repository.getPlayers(
      seasonYear: seasonYear,
      teamId: teamId,
    );

    // Controller で ApiResult をハンドリングし、domain モデルに変換
    return result.when(
      success: (message, data) {
        final players = data.map((e) => Player(
          id: e.id,
          name: e.name,
          position: e.position,
        )).toList();
        _ref.read(playerProvider.notifier).setPlayers(players);
        return players;
      },
      error: (message, error) {
        throw Exception(error);
      },
      validationError: (message, errors) {
        throw Exception(message);
      },
    );
  }
}
```

## 設計ルール

| ルール | 説明 |
|--------|------|
| API呼び出しのみ | データ整形・State更新・UIロジックは行わない |
| interface + 実装クラス | 必ず抽象クラスと実装クラスに分離する |
| ドメインごとにフォルダ分け | player/ team/ season/ のようにドメイン単位で整理する |
| 戻り値は `ApiResult<T>` | `T` には `types/api/` のResponse型を指定する |
| エラーも `ApiResult` で返す | try-catch で例外を捕捉し `ApiResult.error()` として返す。例外をそのまま throw しない |
| Dio インスタンスは DI 可能に | コンストラクタで注入可能にし、テスト時にモックに差し替えられるようにする |

## 命名規則

| 対象 | 規則 | 例 |
|------|------|-----|
| interface | `{ドメイン名}Repository` | `PlayerRepository` |
| 実装クラス | `{ドメイン名}RepositoryImpl` | `PlayerRepositoryImpl` |
| interface ファイル | `{ドメイン名}_repository.dart` | `player_repository.dart` |
| 実装ファイル | `{ドメイン名}_repository_impl.dart` | `player_repository_impl.dart` |
| メソッド名 | HTTP動詞に対応 | `getPlayers()`, `createPlayer()`, `updatePlayer()`, `deletePlayer()` |
