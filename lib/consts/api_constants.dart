/// API通信に関する定数を定義するクラス
class ApiConstants {
  /********************************************
   * ベースURL
   ********************************************/
  /// APIのベースURL
  static const String baseUrl = 'https://api.example.com';

  /********************************************
   * タイムアウト
   ********************************************/
  /// 接続タイムアウト（ミリ秒）
  static const int connectTimeout = 30000;

  /// 受信タイムアウト（ミリ秒）
  static const int receiveTimeout = 30000;

  /// 送信タイムアウト（ミリ秒）
  static const int sendTimeout = 30000;

  /********************************************
   * ヘッダー
   ********************************************/
  /// Content-Type
  static const String contentType = 'application/json';

  /// Accept
  static const String accept = 'application/json';
}
