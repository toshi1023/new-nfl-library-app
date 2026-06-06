/// バリデーションエラー表示用のヘルパー
/// 概要:
///   - バリデーションエラー表示用のヘルパー
/// 主な仕様:
///   - エラーを文字列に変換
///   - 特定のフィールドのエラーを取得
///   - エラーがあるかチェック
///   - 特定のフィールドにエラーがあるかチェック
class ValidationErrorHelper {
  /// エラーを文字列に変換
  static String errorsToString(Map<String, List<String>> errors) {
    if (errors.isEmpty) return '';

    return errors.entries
        .map((entry) => entry.value.join('\n'))
        .join('\n');
  }

  /// 特定のフィールドのエラーを取得
  static List<String> getFieldErrors(
    Map<String, List<String>> errors,
    String fieldName,
  ) {
    return errors[fieldName] ?? [];
  }

  /// エラーがあるかチェック
  static bool hasErrors(Map<String, List<String>> errors) {
    return errors.isNotEmpty;
  }

  /// 特定のフィールドにエラーがあるかチェック
  static bool hasFieldError(
    Map<String, List<String>> errors,
    String fieldName,
  ) {
    return errors.containsKey(fieldName) && errors[fieldName]!.isNotEmpty;
  }
}