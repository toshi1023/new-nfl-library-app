import 'package:flutter/material.dart';
import 'package:nfl_library_app/consts/style_constants.dart';

class CommonFunctions {
  /// スナックバーを表示する
  /// Parameters: 
  /// * [context] - BuildContext
  /// * [message] - 表示するメッセージ
  /// * [backgroundColor] - スナックバーの背景色（デフォルトはStyleConstants.appColor）
  /// * [textStyle] - メッセージのテキストスタイル（デフォルトは白色のテキストスタイル）
  /// * [duration] - スナックバーの表示時間（デフォルトは3秒）
  /// * [actionLabel] - アクションボタンのラベル（デフォルトは「閉じる」）
  /// * [actionTextColor] - アクションボタンのテキスト色（デフォルトは白色）
  /// 
  /// Returns:
  /// void - スナックバーを表示するだけで、戻り値はない
  static void showSnackBar(BuildContext context, String message, {Color backgroundColor = StyleConstants.appColor, TextStyle textStyle = const TextStyle(color: Colors.white), Duration duration = const Duration(seconds: 3), String actionLabel = '閉じる', Color actionTextColor = Colors.white}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: textStyle),
        backgroundColor: backgroundColor,
        duration: duration,
        action: SnackBarAction(
          label: actionLabel,
          textColor: actionTextColor,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  /// エラースナックバーを表示する
  /// Parameters:
  /// * [context] - BuildContext
  /// * [message] - 表示するエラーメッセージ
  /// * [textStyle] - メッセージのテキストスタイル（デフォルトは白色のテキストスタイル）
  /// * [duration] - スナックバーの表示時間（デフォルトは3秒）
  /// * [actionLabel] - アクションボタンのラベル（デフォルトは「閉じる」）
  /// * [actionTextColor] - アクションボタンのテキスト色（デフォルトは白色）
  ///
  /// Returns:
  /// void - エラー用のスナックバーを表示するだけで、戻り値はない
  static void showErrorSnackBar(BuildContext context, String message, {TextStyle textStyle = const TextStyle(color: Colors.white), Duration duration = const Duration(seconds: 3), String actionLabel = '閉じる', Color actionTextColor = Colors.white}) {
    showSnackBar(
      context, 
      message, 
      backgroundColor: StyleConstants.errorColor, 
      textStyle: textStyle, 
      duration: duration, 
      actionLabel: actionLabel, 
      actionTextColor: actionTextColor
    );
  }
}