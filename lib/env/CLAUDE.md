# env/ の構成ガイド

## 役割

環境ごとに変わる値（APIのベースURLなど）を管理する。値はプロジェクトルートの `.env` に記述し、[envied](https://pub.dev/packages/envied) で `Env` クラスに読み込む。

## 既存クラス一覧

| クラス | ファイル | 管理対象 |
|--------|---------|---------|
| `Env` | `env.dart` | `.env` から読み込む環境変数（`env.g.dart` を生成） |

## Env の定義済み値

| 定数 | `.env` のキー | 用途 |
|------|-------------|------|
| `apiBaseUrl` | `API_BASE_URL` | APIのベースURL（`ApiConstants.baseUrl` から参照） |

## 設計ルール

- `.env` と生成ファイル `env.g.dart` は Git 管理外。初回は `.env.example` をコピーして `.env` を作成し、build_runner を実行する
- `.env` を変更した場合は build_runner で `env.g.dart` を再生成する（値はビルド時に埋め込まれる）
- 新しい環境変数を追加する場合は、`.env` / `.env.example` / `Env` の3箇所に追加する
- 各クラスからは `Env` を直接参照せず、`consts/` の定数クラス（`ApiConstants` など）経由で利用する
