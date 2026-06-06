import 'package:flutter/material.dart';
import 'package:nfl_library_app/consts/common_constants.dart';
import 'package:nfl_library_app/consts/style_constants.dart';

/// アプリロゴの共通クラス
class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          CommonConstants.nflLogoImage,
          width: 35,
        ),
        const Padding(
          padding: EdgeInsets.all(StyleConstants.xs),
          child: Text(
            'LIBRARY', 
            style: TextStyle(
              color: StyleConstants.whiteColor,
              fontSize: 14,
              fontFamily: StyleConstants.displayFont
            )
          ),
        ),
      ],
    );
  }
}