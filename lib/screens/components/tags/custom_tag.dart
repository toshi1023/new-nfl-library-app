import 'package:flutter/material.dart';
import 'package:nfl_library_app/consts/style_constants.dart';

/// カスタムタグウィジェット
class CustomTag extends StatelessWidget {
  const CustomTag({
    Key? key,
    required this.text,
    required this.onTap,
    this.fontSize = 14,
    this.fontColor = StyleConstants.darkGray,
    this.fontWeight = FontWeight.w600,
    this.backgroundColor = StyleConstants.lightGray,
    this.borderRadius = StyleConstants.md,
  }) : super(key: key);

  final String text;
  final void Function(String) onTap;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontWeight: fontWeight,
          ),
        ),
        onDeleted: () {
          onTap(text);
        },
        backgroundColor: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}