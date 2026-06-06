import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nfl_library_app/consts/style_constants.dart';
import 'package:nfl_library_app/controllers/pages/home_screen_controller.dart';
import 'package:nfl_library_app/screens/components/bars/custom_app_main_bar.dart';
import 'package:nfl_library_app/screens/components/forms/custom_search_input.dart';
import 'package:nfl_library_app/screens/components/forms/custom_select_box.dart';
import 'package:nfl_library_app/screens/components/tags/custom_select_tag.dart';
import 'package:nfl_library_app/screens/components/tags/custom_tag.dart';
import 'package:nfl_library_app/types/ui/i_select_box.dart';

/// StatefulWidgetのデモページ
/// 状態を持つウィジェットの基本的な使い方を示します
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int? _selectYearItem = 0; // 選択されたシーズン（TODO: フィルタリング機能で使用予定）
  int? _selectTeamItem = 0; // 選択されたチーム（TODO: フィルタリング機能で使用予定）
  final List<String> _searchKeywords = [];

  // スクロール連動アニメーション用
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isSearchVisible = true;

  // Future を一度だけ取得するためのインスタンス変数
  late HomeScreenController _controller;

  @override
  void initState() {
    super.initState();

    // コントローラーとFutureを初期化
    _controller = HomeScreenController();

    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),  // Tweenのbeginからendまでのアニメーションを300msの間で実行する設定
      vsync: this, // 画面が更新されるタイミングでのみアニメーションを更新(this: TickerProviderStateMixinのcreateTicker()をAnimationControllerが使用するため)
    );

    // vsyncのおかげで以下が自動的に行われる：
    // 1. アプリがバックグラウンドに移動したとき
    // → アニメーションが自動的に一時停止
    // 2. 画面外にスクロールしたとき
    // → そのWidgetのアニメーションが停止
    // 3. 画面に戻ってきたとき
    // → アニメーションが自動的に再開
    // ★これらすべてがvsync: thisの一行で実現される！

    // Tween
    // - アニメーションの開始値と終了値を定義
    // - begin: 1.0 = 100%表示（元のサイズ）
    // - end: 0.0 = 0%表示（完全に隠れる）
    // CurvedAnimation
    // - アニメーションの動きの滑らかさを制御
    // - curve: Curves.easeInOut = ゆっくり始まって、ゆっくり終わる
    _expandAnimation = Tween<double>(
      begin: 1.0, // 完全表示
      end: 0.0,    // 完全収納
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // スクロール監視
    _scrollController.addListener(_onScroll);
  }

  /// スクロール方向に応じて検索エリアの表示/非表示を切り替える
  void _onScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      // 下スクロール時：非表示
      if (_isSearchVisible) {
        _isSearchVisible = false;
        _animationController.forward();
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      // 上スクロール時：表示
      if (!_isSearchVisible) {
        _isSearchVisible = true;
        _animationController.reverse();
      }
    }
  }

  /// 入力欄の値を受け取って検索処理を実行する
  /// 入力値はタグに追加する
  void callbackHandleInput(String value) {
    if (value.isNotEmpty) {
      setState(() {
        _searchKeywords.add(value);
      });
      // 検索処理を実行
    }
  }

  /// クリックしたタグを入力欄から除外する
  void callbackHandleDeleteTag(String value) {
    // タグを削除する処理
    setState(() {
      _searchKeywords.remove(value);
    });
  }

  /// 選択シーズンの更新処理
  void callbackChangeSeason(ISelectBox<int> value) {
    setState(() {
      _selectYearItem = value.value;
    });
    // 両方選択されている場合のみ処理を実行
    _checkBothSelected();
  }

  /// 選択チームの更新処理
  void callbackChangeTeam(ISelectBox<int> value) {
    setState(() {
      _selectTeamItem = value.value;
    });
    // 両方選択されている場合のみ処理を実行
    _checkBothSelected();
  }

  /// 両方が選択されているかチェック（エラー表示なし）
  void _checkBothSelected() {
    if (_selectYearItem != null && _selectYearItem != 0 &&
        _selectTeamItem != null && _selectTeamItem != 0) {
      // 両方選択されている場合の処理（例：検索実行など）
      // TODO: 必要に応じて処理を追加
    }
  }

  @override
  void dispose() {
    // disposeによりイベントリスナーやアニメーションのメモリを解放する
    // イベントリスナー等の解除をしないとメモリーリークの原因になる
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppMainBar(),
      body: // 検索エリア（Input部分のみアニメーション）
        Container(
          padding: const EdgeInsets.all(StyleConstants.sm),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              // アニメーション付き検索入力欄(SizeTransition：サイズ変更（高さや幅を変更）を実現)
              SizeTransition(
                // SizeTransitionで囲った範囲のサイズの収縮、拡張を管理
                sizeFactor: _expandAnimation,
                child: Column(
                  children: [
                    CustomSearchInput(
                      label: '選手名で検索',
                      callback: callbackHandleInput,
                    ),
                    const SizedBox(height: StyleConstants.sm), // 間隔を追加
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  // 横スクロールを可能にする
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // 年代のメニューリスト
                      FutureBuilder<List<ISelectBox<int>>>(
                          future: _controller.fetchSeasonList(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData) {
                              return SizedBox(
                                  width: 110,
                                  height: 35,
                                  child: CustomSelectBox<int>(
                                    selectList: snapshot.data!, 
                                    title: 'シーズンを選択してください', 
                                    callback: callbackChangeSeason, 
                                    backgroundColor: StyleConstants.lightGray, 
                                    textColor: StyleConstants.gray
                                  )
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }
                      ),
                      const SizedBox(width: StyleConstants.sm), // 間隔を追加
                      ..._searchKeywords.map((keyword) => CustomTag(text: keyword, onTap: callbackHandleDeleteTag))
                    ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: StyleConstants.sm),
                child: Row(
                  children: [
                    // チームのメニューリスト
                    FutureBuilder<List<ISelectBox<int>>>(
                        future: _controller.fetchTeamList(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData) {
                            return Expanded(
                              flex: 1, 
                              child: CustomSelectTag<int>(selectList: snapshot.data!, callback: callbackChangeTeam, selectionPrompt: 'チームを選択してください')
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
