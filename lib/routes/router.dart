import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:nfl_library_app/screens/pages/home_screen.dart';
import 'package:nfl_library_app/screens/pages/menu_screen.dart';

final goRouter = GoRouter(
  // アプリが起動した時
  initialLocation: '/',
  // ルートと画面の紐付けを定義
  routes: _defineRoutes(),
  // 遷移ページがないなどのエラーが発生した時に、遷移するページを定義
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);

/// ルーティングの定義
List<GoRoute> _defineRoutes() {
  return [
    GoRoute(
      path: '/',
      name: 'initial',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
    ),
  ];
}