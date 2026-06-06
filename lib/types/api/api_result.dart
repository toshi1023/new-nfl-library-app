import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';
part 'api_result.g.dart';

/// APIレスポンス用のunion型
/// 成功時とエラー時で異なる構造を持つ
@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  /// 成功時のレスポンス
  const factory ApiResult.success({
    required String message,
    @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) required T data,
  }) = ApiSuccess<T>;

  /// エラー時のレスポンス
  const factory ApiResult.error({
    required String message,
    required String error,
  }) = ApiError<T>;

  /// バリデーションエラー時のレスポンス
  const factory ApiResult.validationError({
    required String message,
    @JsonKey(fromJson: _errorsFromJson, toJson: _errorsToJson)
    required Map<String, List<String>> errors,
  }) = ApiValidationError<T>;

  /// JSONからオブジェクトを作成するファクトリコンストラクタ
  factory ApiResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResultFromJson(json);
}

/// データのJSON変換用ヘルパー関数
T _dataFromJson<T>(Object? json) {
  return json as T;
}

/// データのJSON変換用ヘルパー関数
Object? _dataToJson<T>(T data) {
  return data;
}

/// エラーのJSON変換用ヘルパー関数
Map<String, List<String>> _errorsFromJson(Object? json) {
  if (json == null) return {};

  if (json is Map<String, dynamic>) {
    return json.map((key, value) {
      if (value is List) {
        return MapEntry(key, value.cast<String>());
      } else if (value is String) {
        return MapEntry(key, [value]);
      } else {
        return MapEntry(key, <String>[]);
      }
    });
  }

  return {};
}

/// エラーのJSON変換用ヘルパー関数
Object? _errorsToJson(Map<String, List<String>> errors) {
  return errors;
}

/// 成功時のレスポンス用の拡張メソッド
extension ApiSuccessExtension<T> on ApiSuccess<T> {
  /// 成功かどうかを判定
  bool get isSuccess => true;

  /// エラーかどうかを判定
  bool get isError => false;

  /// バリデーションエラーかどうかを判定
  bool get isValidationError => false;
}

/// エラー時のレスポンス用の拡張メソッド
extension ApiErrorExtension<T> on ApiError<T> {
  /// 成功かどうかを判定
  bool get isSuccess => false;

  /// エラーかどうかを判定
  bool get isError => true;

  /// バリデーションエラーかどうかを判定
  bool get isValidationError => false;
}

/// バリデーションエラー時のレスポンス用の拡張メソッド
extension ApiValidationErrorExtension<T> on ApiValidationError<T> {
  /// 成功かどうかを判定
  bool get isSuccess => false;

  /// エラーかどうかを判定
  bool get isError => true;

  /// バリデーションエラーかどうかを判定
  bool get isValidationError => true;
}

/// レスポンスの便利なメソッド
extension ApiResultExtension<T> on ApiResult<T> {
  /// 成功時のデータを取得（エラーの場合はnull）
  T? get dataOrNull => when(
        success: (message, data) => data,
        error: (message, error) => null,
        validationError: (message, errors) => null,
      );

  /// エラー時のエラーメッセージを取得（成功の場合はnull）
  String? get errorOrNull => when(
        success: (message, data) => null,
        error: (message, error) => error,
        validationError: (message, errors) => null,
      );

  /// バリデーションエラー時のエラーメッセージを取得（成功の場合はnull）
  Map<String, List<String>>? get validationErrorsOrNull => when(
        success: (message, data) => null,
        error: (message, error) => null,
        validationError: (message, errors) => errors,
      );

  /// メッセージを取得（成功・エラー共通）
  String get message => when(
        success: (message, data) => message,
        error: (message, error) => message,
        validationError: (message, errors) => message,
      );

  /// 成功かどうかを判定
  bool get isSuccess => when(
        success: (message, data) => true,
        error: (message, error) => false,
        validationError: (message, errors) => false,
      );

  /// エラーかどうかを判定
  bool get isError => when(
        success: (message, data) => false,
        error: (message, error) => true,
        validationError: (message, errors) => true,
      );

  /// バリデーションエラーかどうかを判定
  bool get isValidationError => when(
        success: (message, data) => false,
        error: (message, error) => false,
        validationError: (message, errors) => true,
      );
}
