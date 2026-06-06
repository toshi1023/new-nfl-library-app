import 'package:flutter/material.dart';
import 'package:nfl_library_app/consts/style_constants.dart';

/// ボタン用のコンポーネントクラス
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.isRounded = false,
    this.isDisabled = false,
    this.isOutline = false,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.width = double.infinity,
    this.height = 50,
  }) : super(key: key);
  /// ボタンのラベル
  final String text;
  /// ボタンを押したときに実行するコールバック関数
  final VoidCallback onPressed;
  /// ボタンの背景色（オプション）
  final Color? backgroundColor;
  /// ボタンの枠線の色（オプション）
  final Color? borderColor;
  /// ボタンのテキストの色（オプション）
  final Color? textColor;
  /// ボタンの角の丸みの程度（オプション）
  final bool isRounded;
  /// ボタンが無効化されているかどうか（オプション）
  final bool isDisabled;
  /// ボタンをアウトラインスタイルにするかどうか（オプション）
  final bool isOutline;
  /// ボタンのフォントサイズ（オプション）
  final double fontSize;
  /// ボタンのフォントの太さ（オプション）
  final FontWeight fontWeight;
  /// ボタンの幅（オプション）
  final double width;
  /// ボタンの高さ（オプション）
  final double height;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = this.backgroundColor ?? (isDisabled && !isOutline ? StyleConstants.gray : isOutline ? StyleConstants.whiteColor : StyleConstants.appColor);
    final Color textColor = this.textColor ?? (isDisabled && isOutline ? StyleConstants.gray : !isDisabled && isOutline ? StyleConstants.appColor : StyleConstants.whiteColor);
    final Color borderColor = this.borderColor ?? (isDisabled ? StyleConstants.gray : isOutline ? StyleConstants.whiteColor : StyleConstants.appColor);
    return isOutline ? ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: Size(width, height),
          side: BorderSide(color: borderColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isRounded ? 50 : 0),
          )
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      )
    :
      OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: Size(width, height),
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isRounded ? 50 : 0),
          )
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      );
  }
}