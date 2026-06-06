# プロジェクト構成ガイド

## 技術スタック

| カテゴリ | パッケージ | 用途 |
|---------|-----------|------|
| 状態管理 | riverpod / flutter_riverpod (3.x) | Notifier + Provider パターン |
| ルーティング | go_router (17.x) | 型安全なルーティング |
| コード生成 | freezed / json_serializable / riverpod_generator | 不変クラス・JSON変換・Provider生成 |
| ビルド | build_runner | コード生成の実行基盤 |
| Lint | flutter_lints / riverpod_lint | 静的解析 |

## フォルダ構成

```
lib/
├── consts/          # 共通定数
├── controllers/     # ビジネスロジック
│   ├── components/  #   └ コンポーネント用
│   └── pages/       #   └ ページ用
├── providers/       # Riverpod State / Notifier
│   ├── components/  #   └ コンポーネント用
│   ├── domains/     #   └ ドメイン用(keepAlive)
│   └── pages/       #   └ ページ用(auto-dispose)
├── repositories/    # API呼び出し定義
├── routes/          # ルート定義
├── screens/         # UI描画
│   ├── components/  #   └ 再利用可能なコンポーネント
│   └── pages/       #   └ ページ
├── types/           # 型定義
│   ├── api/         #   └ DTO (Request/Response)
│   ├── domain/      #   └ ビジネスロジック層の型
│   ├── entity/      #   └ エンティティ
│   └── ui/          #   └ UI構築用の型
└── utils/           # ユーティリティ関数
```

## 各層の役割

### consts/
各クラスで利用する共通の定数を管理する。スタイル定数（色・サイズ・フォント）や共通定数を定義。

### controllers/
ビジネスロジックを管理する。Repositoryを通じてAPIで取得した値をNotifierなどを通じてStateに反映する。

### providers/
RiverpodのStateクラスとNotifierクラスを管理する。`Notifier` + `NotifierProvider` パターンで定義する。

### repositories/
API呼び出しの定義を管理する。HTTP通信の実装を担当。

### routes/
GoRouterによるルート定義を管理する。

### screens/
FlutterのWidget（ページ・コンポーネント）を管理する。UI描画のみを担当し、ビジネスロジックは持たない。

### types/
型の定義を管理する。freezed / json_serializableによるコード生成対象を含む。

### utils/
複数の画面やコントローラーから利用される共通処理を管理する。
実装時は必ず既存のutilsクラスを確認し、該当する処理があればそれを利用すること。
共通処理となりうる処理がutilsに未実装の場合は、該当クラスにメソッドを追加する。適切なクラスがなければ新規クラスを作成する。

| クラス | ファイル | 役割 |
|--------|---------|------|
| `CommonFunctions` | `common_function.dart` | UI通知系（SnackBar表示、エラーSnackBar表示） |
| `LoadingHelper` | `loading_helper.dart` | ローディング制御（表示/非表示、非同期処理のラップ） |
| `LogFunction` | `log_function.dart` | ログ出力（debug/info/warn/error、Crashlytics連携） |
| `ValidationErrorHelper` | `validation_error_helper.dart` | バリデーションエラー処理（エラー文字列変換、フィールド別エラー取得） |

**新規クラス追加の判断基準:**
上記のいずれにも該当しない共通処理（例: 日付フォーマット、文字列加工、画面遷移ヘルパーなど）が必要な場合は、`{用途}_helper.dart` または `{用途}_function.dart` の命名で新規クラスを作成する。

## 命名規則

| 対象 | 規則 | 例 |
|------|------|-----|
| ファイル名 | snake_case | `home_screen.dart` |
| クラス名 | PascalCase | `HomeScreen` |
| コンポーネント | `custom_` プレフィックス | `custom_button.dart` |
| ページ | `_screen` サフィックス | `home_screen.dart` |
| Provider | `_provider` サフィックス | `loading_provider.dart` |
| State | `_state` サフィックス | `loading_state.dart` |
| Controller | `_controller` サフィックス | `home_screen_controller.dart` |
| UI型 | `i_` プレフィックス | `i_select_box.dart` |

## データフロー

```
Repository（API通信）
    ↓
Controller（ビジネスロジック）
    ↓
Provider / Notifier（状態管理）
    ↓
Screen（UI描画）
```

## コード生成

freezed / json_serializable / riverpod_generator を使用する場合は以下のコマンドで生成ファイルを更新する。

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

生成ファイル（`.freezed.dart`, `.g.dart`）は手動で編集しない。
