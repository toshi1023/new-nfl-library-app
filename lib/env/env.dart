import 'package:envied/envied.dart';

part 'env.g.dart';

/// .env ファイルから読み込む環境変数を定義するクラス
/// .env を変更した場合は build_runner で env.g.dart を再生成すること
@Envied(path: '.env', requireEnvFile: true)
abstract class Env {
  /// APIのベースURL
  @EnviedField(varName: 'API_BASE_URL')
  static const String apiBaseUrl = _Env.apiBaseUrl;
}
