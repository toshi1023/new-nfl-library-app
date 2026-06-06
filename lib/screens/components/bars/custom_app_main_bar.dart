/// AppBarの共通クラス

import 'package:flutter/material.dart';
import 'package:nfl_library_app/screens/components/logos/custom_app_logo.dart';
import 'package:nfl_library_app/consts/style_constants.dart';

class CustomAppMainBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppMainBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,  // 戻るボタンが自動で付くのを防ぐ
      title: const CustomAppLogo(),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            color: StyleConstants.whiteColor,
            icon: const Icon(IconData(0xe498, fontFamily: 'MaterialIcons')),
            onPressed: () {
              // アカウント編集がクリックされた時
              Navigator.of(context).pushNamed("/account_edit");
            },
          )
        ),
      ],
      backgroundColor: StyleConstants.appColor,
    );
  }
}