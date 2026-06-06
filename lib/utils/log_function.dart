// import 'dart:developer' as developer;
// import 'package:cerebro_app/consts/common_const_list.dart';
// import 'package:flutter/foundation.dart';
// import 'package:cerebro_app/env/env.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';


// /// ログ出力の関数を定義する。
// ///
// /// 概要:
// ///   - ログを出力する関数。
// /// 主な仕様:
// ///   - ログを出力する関数を定義する。
// /// 制限事項:
// ///   - ログを出力する関数を定義する。
// class LogFunction {
//   LogFunction._();

//   static const String _defaultTag = CommonConstList.appName;

//   // ログ出力用関数

//   /// デバッグログ出力用関数
//   /// [message] ログメッセージ
//   /// [tag] ログタグ(Class名を入れる、例： MedicationManagementTopScreenなど)
//   /// 戻り値:
//   ///   - ログを出力する関数。
//   static void d(Object message, {String? tag}) =>
//       _log(_LogLevel.debug, message, tag: tag);

//   /// 情報ログ出力用関数
//   /// [message] ログメッセージ
//   /// [tag] ログタグ(Class名を入れる、例： MedicationManagementTopScreenなど)
//   /// 戻り値:
//   ///   - ログを出力する関数。
//   static void i(Object message, {String? tag}) =>
//       _log(_LogLevel.info, message, tag: tag);

//   /// 警告ログ出力用関数
//   /// [message] ログメッセージ
//   /// [tag] ログタグ(Class名を入れる、例： MedicationManagementTopScreenなど)
//   /// [error] エラー
//   /// [stackTrace] スタックトレース
//   /// 戻り値:
//   ///   - ログを出力する関数。
//   static void w(Object message, {String? tag, dynamic error, StackTrace? stackTrace}) =>
//       _log(_LogLevel.warning, message, tag: tag, error: error, stackTrace: stackTrace);

//   /// エラーログ出力用関数
//   /// [message] ログメッセージ
//   /// [tag] ログタグ(Class名を入れる、例： MedicationManagementTopScreenなど)
//   /// [error] エラー
//   /// [stackTrace] スタックトレース
//   /// 戻り値:
//   ///   - ログを出力する関数。
//   static void e(Object message, {String? tag, dynamic error, StackTrace? stackTrace, FlutterErrorDetails? flutterErrorDetails}) =>
//       _log(_LogLevel.error, message, tag: tag, error: error, stackTrace: stackTrace, flutterErrorDetails: flutterErrorDetails);

//   /// ログ出力用関数
//   /// [level] ログレベル
//   /// [message] ログメッセージ
//   /// [tag] ログタグ(Class名を入れる、例： MedicationManagementTopScreenなど)
//   /// [error] エラー
//   /// [stackTrace] スタックトレース
//   /// [flutterErrorDetails] FlutterErrorDetails
//   /// 戻り値:
//   ///   - ログを出力する関数。
//   static void _log(
//     _LogLevel level,
//     Object message, {
//     String? tag,
//     dynamic error,
//     StackTrace? stackTrace,
//     FlutterErrorDetails? flutterErrorDetails,
//   }) {
//     // リリース/本番ではエラー関連以外のログを抑制
//     final bool isReleaseOrProd = kReleaseMode || _isProdByEnv;
//     if (isReleaseOrProd && (level == _LogLevel.debug || level == _LogLevel.info)) {
//       return;
//     }

//     final now = DateTime.now().toIso8601String();
//     final label = _label(level);
//     final name = tag ?? _defaultTag;

//     final text =
//         '[$now][$label][$name] ${_stringify(message)}'
//         '${error != null ? ' | error: ${_stringify(error)}' : ''}'
//         '${stackTrace != null ? '\n$stackTrace' : ''}';

//     if(isReleaseOrProd) {
//       /// Flutter内で発生したエラーを全てFirebaseに送信(通常のtrycatch文で取得した例外処理もこれで送信する)
//       if(flutterErrorDetails != null) {
//         FirebaseCrashlytics.instance.recordFlutterFatalError(flutterErrorDetails);
//       } else {
//         // Flutterフレームワークによって処理されていないすべての未捕捉非同期エラーをCrashlyticsに渡す
//         FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
//       }
//     } else {
//       // コンソール
//       debugPrint(text);

//       // DevTools Timeline
//       developer.log(
//         _stringify(message),
//         name: name,
//         error: error,
//         stackTrace: stackTrace,
//         level: _numericLevel(level),
//         time: DateTime.now(),
//       );
//     }
//   }

//   // .envファイルのappModeがproductionかどうかを判定する
//   static bool get _isProdByEnv {
//     try {
//       final m = Env.appMode.toLowerCase();
//       return m == 'production';
//     } catch (_) {
//       return false;
//     }
//   }

//   static String _label(_LogLevel l) {
//     switch (l) {
//       case _LogLevel.debug:
//         return 'DEBUG';
//       case _LogLevel.info:
//         return 'INFO';
//       case _LogLevel.warning:
//         return 'WARN';
//       case _LogLevel.error:
//         return 'ERROR';
//     }
//   }

//   static int _numericLevel(_LogLevel l) {
//     switch (l) {
//       case _LogLevel.debug:
//         return 500;
//       case _LogLevel.info:
//         return 800;
//       case _LogLevel.warning:
//         return 900;
//       case _LogLevel.error:
//         return 1000;
//     }
//   }

//   static String _stringify(Object obj) {
//     try {
//       return obj.toString();
//     } catch (_) {
//       return '<non-stringifiable>';
//     }
//   }
// }

// enum _LogLevel { debug, info, warning, error }