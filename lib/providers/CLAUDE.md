# providers/ の構成ガイド

## フォルダ構成

```
providers/
├── components/    # コンポーネント用（ローディング、ダイアログ等）
│   └── loading/
│       ├── loading_state.dart
│       └── loading_provider.dart
├── domains/       # ドメイン用（keepAlive — アプリ全体で保持）
└── pages/         # ページ用（auto-dispose — 画面離脱時に破棄）
```

## ファイル構成ルール

1つの機能につき、同一フォルダ内に以下の2ファイルを配置する。

| ファイル | 役割 | 命名規則 |
|---------|------|---------|
| `*_state.dart` | 状態を保持する不変クラス | `{機能名}_state.dart` |
| `*_provider.dart` | Notifier + Provider の定義 | `{機能名}_provider.dart` |

## State の書き方

### ページ用 State — sealed class パターン（推奨）

画面の状態遷移（初期 / ローディング / 取得完了 / エラー）を `sealed class` で定義する。
`switch` 式で全状態の網羅チェックがコンパイル時に行われ、状態の追加漏れを防げる。

```dart
sealed class PlayerState {
  const PlayerState();
}

class PlayerStateInitial extends PlayerState {
  const PlayerStateInitial();
}

class PlayerStateLoading extends PlayerState {
  const PlayerStateLoading();
}

class PlayerStateLoaded extends PlayerState {
  final List<Player> players;
  const PlayerStateLoaded({required this.players});
}

class PlayerStateError extends PlayerState {
  final String message;
  const PlayerStateError({required this.message});
}
```

### コンポーネント用 State — シンプルクラスパターン

ローディングなど状態遷移が単純なものは、`const` コンストラクタと `copyWith` を持つクラスで定義する。

```dart
class LoadingState {
  final bool isLoading;
  final String? message;

  const LoadingState({
    this.isLoading = false,
    this.message,
  });

  LoadingState copyWith({
    bool? isLoading,
    String? message,
  }) {
    return LoadingState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }
}
```

### 使い分け

| パターン | 用途 |
|---------|------|
| `sealed class` | 状態遷移が明確（初期→ローディング→完了/エラー）なページ用State |
| シンプルクラス + `copyWith` | 状態遷移が単純（on/off 程度）なコンポーネント用State |

## Notifier + Provider の書き方

### 基本パターン（components/）

```dart
class LoadingNotifier extends Notifier<LoadingState> {
  @override
  LoadingState build() => const LoadingState();

  void startLoading({String? message}) {
    state = LoadingState(isLoading: true, message: message);
  }

  void stopLoading() {
    state = const LoadingState();
  }
}

final loadingProvider = NotifierProvider<LoadingNotifier, LoadingState>(
  LoadingNotifier.new,
);
```

### domains/ — keepAlive（アプリ全体で状態を保持）

ログインユーザー情報、マスターデータなど、アプリのライフサイクル全体で保持すべき状態に使用する。

```dart
// 例: ログインユーザー情報
class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  void setUser(User user) {
    state = state.copyWith(user: user, isAuthenticated: true);
  }

  void logout() {
    state = const AuthState();
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
```

### pages/ — auto-dispose（画面離脱時に状態を破棄）

フォーム入力など、画面を離れたら不要になる一時的な状態に使用する。

```dart
// 例: プロフィール編集フォームの状態
class ProfileEditNotifier extends AutoDisposeNotifier<ProfileEditState> {
  @override
  ProfileEditState build() => const ProfileEditState();

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateBio(String bio) {
    state = state.copyWith(bio: bio);
  }

  void reset() {
    state = const ProfileEditState();
  }
}

final profileEditProvider =
    AutoDisposeNotifierProvider<ProfileEditNotifier, ProfileEditState>(
  ProfileEditNotifier.new,
);
```

## 使い分けの判断基準

| 配置先 | ライフサイクル | 用途の例 |
|--------|-------------|---------|
| `components/` | 機能に応じて判断 | ローディング、ダイアログ、トースト |
| `domains/` | keepAlive（破棄しない） | 認証情報、マスターデータ、お気に入りチーム、検索条件 |
| `pages/` | auto-dispose（画面離脱で破棄） | フォーム入力、ページ固有の一時状態 |

## Screen からの利用

```dart
// 状態の監視（リビルド対象）
final state = ref.watch(loadingProvider);

// 状態の読み取り（リビルドしない）
final state = ref.read(loadingProvider);

// Notifier のメソッド呼び出し
ref.read(loadingProvider.notifier).startLoading();
```
