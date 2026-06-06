import 'package:flutter/material.dart';

/// アプリ共通のスタイルに関する定数を定義するクラス
class StyleConstants {
  /********************************************
   * サイズ
   ********************************************/
  /// 4.0
  static const double xs = 4.0;
  /// 8.0
  static const double sm = 8.0;
  /// 12.0
  static const double md = 12.0;
  /// 16.0
  static const double lg = 16.0;
  /// 20.0
  static const double xl = 20.0;
  /// 24.0
  static const double xxl = 24.0;

  /// フォントサイズ(12.0)
  static const double fontSizeXs = 12.0;
  /// フォントサイズ(14.0)
  static const double fontSizeSm = 14.0;
  /// フォントサイズ(16.0)
  static const double fontSizeNormal = 16.0;
  /// フォントサイズ(18.0)
  static const double fontSizeMd = 18.0;
  /// フォントサイズ(20.0)
  static const double fontSizeLg = 20.0;

  /********************************************
   * カラー
   ********************************************/
  /// アプリカラー
  static const Color appColor = Color(0xff374A7B);
  /// 白色
  static const Color whiteColor = Color(0xffffffff);
  /// エラー表示用の赤色
  static const Color errorColor = Color(0xffE53935);
  /// グレー系薄色(#EEEEEE)
  static const Color lightGray = Color(0xFFEEEEEE);
  /// グレー系色(#9E9E9E)
  static const Color gray = Color(0xFF9E9E9E);
  /// グレー系濃色(#616161)
  static const Color darkGray = Color(0xFF616161);
  /// 青系色(#1E3A8A)
  static const Color deepBlue = Color(0xFF1E3A8A);

  /********************************************
   * フォント
   ********************************************/
  /// ローマ字明朝(Playfair_Display)
  static const String displayFont = "Playfair_Display";
  /// イタリック調(Dancing_Script)
  static const String italicFont = "Dancing_Script";
}