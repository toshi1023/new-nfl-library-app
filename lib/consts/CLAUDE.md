# consts/ の構成ガイド

## 役割

アプリ全体で使用する共通定数を管理する。マジックナンバーや文字列リテラルの直書きを防ぎ、変更時の影響範囲を1箇所に集約する。

## 既存クラス一覧

| クラス | ファイル | 管理対象 |
|--------|---------|---------|
| `StyleConstants` | `style_constants.dart` | スタイル関連（サイズ、カラー、フォント） |
| `CommonConstants` | `common_constants.dart` | アプリ共通値（アプリ名、画像パスなど） |

実装時は必ず既存の定数クラスを確認し、該当する定数があればそれを利用すること。
新規定数の追加は、該当するクラスに追加する。適切なクラスがなければ `{用途}_constants.dart` の命名で新規クラスを作成する。

## StyleConstants の定義済み値

### サイズ（余白・間隔）

| 定数 | 値 | 用途 |
|------|-----|------|
| `xs` | 4.0 | 最小余白 |
| `sm` | 8.0 | 小余白 |
| `md` | 12.0 | 中余白 |
| `lg` | 16.0 | 大余白 |
| `xl` | 20.0 | 特大余白 |
| `xxl` | 24.0 | 最大余白 |

### フォントサイズ

| 定数 | 値 |
|------|-----|
| `fontSizeXs` | 12.0 |
| `fontSizeSm` | 14.0 |
| `fontSizeNormal` | 16.0 |
| `fontSizeMd` | 18.0 |
| `fontSizeLg` | 20.0 |

### カラー

| 定数 | 値 | 用途 |
|------|-----|------|
| `appColor` | `#374A7B` | アプリのメインカラー |
| `whiteColor` | `#FFFFFF` | 白色 |
| `errorColor` | `#E53935` | エラー表示 |
| `lightGray` | `#EEEEEE` | 薄グレー背景 |
| `gray` | `#9E9E9E` | グレーテキスト |
| `darkGray` | `#616161` | 濃グレーテキスト |
| `deepBlue` | `#1E3A8A` | 濃青 |

### フォント

| 定数 | フォントファミリー |
|------|----------------|
| `displayFont` | Playfair_Display |
| `italicFont` | Dancing_Script |

## CommonConstants の定義済み値

| 定数 | 値 | 用途 |
|------|-----|------|
| `appName` | `"NFL Library"` | アプリ名 |
| `nflLogoImage` | `"assets/images/nfl_logo/nfl_logo_resize.png"` | NFLロゴ画像パス |

## 設計ルール

- 全てのフィールドは `static const` で定義する
- 画面固有の値ではなく、2箇所以上で使用する共通値のみ定義する
- 色・サイズ・フォントは `StyleConstants` に集約する
- アプリ名・画像パス・API URL などの設定値は `CommonConstants` に集約する
- 定数名は用途がわかる名前にする（`sm` のようなサイズ系は例外）
