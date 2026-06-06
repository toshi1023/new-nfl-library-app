# types/ の構成ガイド

## フォルダ構成

```
types/
├── api/       # DTO (Request/Response) — API通信の入出力型
├── domain/    # ドメインモデル — ビジネスロジック層で使用する型
├── entity/    # エンティティ — DBやAPIの生データに対応する型
└── ui/        # UIモデル — 画面描画専用の型
```

## 各層の役割と例

### api/ — DTO (Data Transfer Object)

APIとの通信で使用するリクエスト・レスポンスの型を定義する。
freezed + json_serializable でコード生成を行い、JSONとの相互変換を担保する。

**Request** — フォーム送信やクエリパラメーターで利用する型

```dart
// 例: 選手検索のリクエスト
@freezed
class PlayerSearchRequest with _$PlayerSearchRequest {
  const factory PlayerSearchRequest({
    required int seasonYear,
    required int teamId,
    String? playerName,
  }) = _PlayerSearchRequest;

  factory PlayerSearchRequest.fromJson(Map<String, dynamic> json)
      => _$PlayerSearchRequestFromJson(json);
}
```

**Response** — APIのレスポンスで取得する型

```dart
// 例: 選手一覧のレスポンス
@freezed
class PlayerListResponse with _$PlayerListResponse {
  const factory PlayerListResponse({
    required List<PlayerResponse> players,
    required int totalCount,
  }) = _PlayerListResponse;

  factory PlayerListResponse.fromJson(Map<String, dynamic> json)
      => _$PlayerListResponseFromJson(json);
}
```

**共通レスポンス** — 成功/エラーを統一的に扱う `ApiResult<T>` を定義済み。

### domain/ — ドメインモデル

ビジネスロジック層で使用する型。APIレスポンスを画面に適した形にマッピングした後の型を定義する。
APIの構造に依存せず、アプリの業務ロジックに適した形で設計する。

```dart
// 例: 選手のドメインモデル
class Player {
  final int id;
  final String name;
  final String position;
  final String teamName;
  final String teamLogoPath;  // UIで必要な情報を結合済み

  const Player({
    required this.id,
    required this.name,
    required this.position,
    required this.teamName,
    required this.teamLogoPath,
  });
}
```

### entity/ — エンティティ

DBやAPIの生データ構造に1:1で対応する型。
APIレスポンスの個別オブジェクトをそのままマッピングする場合に使用する。

```dart
// 例: APIレスポンス内の選手エンティティ
@freezed
class PlayerEntity with _$PlayerEntity {
  const factory PlayerEntity({
    required int id,
    required String name,
    required String position,
    @JsonKey(name: 'team_id') required int teamId,
  }) = _PlayerEntity;

  factory PlayerEntity.fromJson(Map<String, dynamic> json)
      => _$PlayerEntityFromJson(json);
}
```

### ui/ — UIモデル

画面やコンポーネントの描画専用の型。
プルダウンの選択肢、タブの構成、フォームの状態など、UIの構築に必要な型を定義する。

```dart
// 例: セレクトボックスの選択肢（定義済み）
class ISelectBox<T> {
  final T value;
  final String text;
  String? shortText;
  String? imageFile;
}
```

## 層間のデータ変換フロー

```
API JSON
  ↓ fromJson()
api/ (Response/Entity)
  ↓ Controller内でマッピング
domain/ (ドメインモデル)
  ↓ 画面に必要な形に変換
ui/ (UIモデル)
  ↓
Screen で描画
```

## 設計ルール

| ルール | 説明 |
|--------|------|
| api/の型はAPIの構造に忠実にする | フィールド名・ネストをAPIに合わせる。`@JsonKey(name:)` でスネークケース変換 |
| domain/の型はAPIに依存しない | API変更時の影響をdomain以降に波及させない |
| ui/の型はWidgetの都合で設計する | 表示用テキスト、画像パスなど描画に必要な情報を持つ |
| freezedはapi/とentity/で使用する | JSON変換が必要な型に適用。domain/やui/はシンプルなクラスでもよい |
| 生成ファイルは手動編集しない | `.freezed.dart` / `.g.dart` は `build_runner` で再生成する |
