import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfl_library_app/consts/style_constants.dart';
import 'package:nfl_library_app/controllers/pages/home_screen_controller.dart';
import 'package:nfl_library_app/providers/pages/home/home_provider.dart';
import 'package:nfl_library_app/providers/pages/home/home_state.dart';
import 'package:nfl_library_app/screens/components/bars/custom_app_main_bar.dart';
import 'package:nfl_library_app/screens/components/forms/custom_search_input.dart';
import 'package:nfl_library_app/screens/components/forms/custom_select_box.dart';
import 'package:nfl_library_app/screens/components/tags/custom_select_tag.dart';
import 'package:nfl_library_app/screens/components/tags/custom_tag.dart';
import 'package:nfl_library_app/types/domain/roster_player.dart';
import 'package:nfl_library_app/types/ui/i_select_box.dart';
import 'package:nfl_library_app/utils/loading_helper.dart';
import 'package:nfl_library_app/utils/common_function.dart';

/// ホーム画面
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  // スクロール連動アニメーション用
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isSearchVisible = true;

  // コントローラー
  late HomeScreenController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _expandAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = HomeScreenController(ref);

    if (!_initialized) {
      _initialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _initializeData();
      });
    }
  }

  /// 初期データの取得
  Future<void> _initializeData() async {
    try {
      await LoadingHelper.withLoading(ref, () async {
        await _controller.initialize();
      }, message: 'データを取得中...');
    } catch (e, stackTrace) {
      print(stackTrace);
      if (mounted) {
        CommonFunctions.showErrorSnackBar(context, e.toString());
      }
    }
  }

  /// スクロール方向に応じて検索エリアの表示/非表示を切り替える
  void _onScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isSearchVisible) {
        _isSearchVisible = false;
        _animationController.forward();
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!_isSearchVisible) {
        _isSearchVisible = true;
        _animationController.reverse();
      }
    }
  }

  /// 入力欄の値を検索キーワードに追加して選手名検索を実行する
  Future<void> callbackHandleInput(String value) async {
    final name = value.trim();
    if (name.isEmpty) return;
    await _searchByName(() => _controller.addSearchName(name));
  }

  /// クリックしたタグを検索キーワードから除外して再検索する
  Future<void> callbackHandleDeleteTag(String value) async {
    await _searchByName(() => _controller.removeSearchName(value));
  }

  /// 選手名検索の実行（ローディング表示・エラー通知を共通化）
  Future<void> _searchByName(Future<void> Function() search) async {
    try {
      await LoadingHelper.withLoading(ref, search,
          message: '選手データを取得中...');
    } catch (e) {
      if (mounted) {
        CommonFunctions.showErrorSnackBar(context, e.toString());
      }
    }
  }

  /// 選択シーズンの更新処理
  Future<void> callbackChangeSeason(ISelectBox<int> value) async {
    try {
      await LoadingHelper.withLoading(ref, () async {
        await _controller.changeSeason(value.value);
      }, message: '選手データを取得中...');
    } catch (e) {
      if (mounted) {
        CommonFunctions.showErrorSnackBar(context, e.toString());
      }
    }
  }

  /// 選択チームの更新処理
  Future<void> callbackChangeTeam(ISelectBox<int> value) async {
    try {
      await LoadingHelper.withLoading(ref, () async {
        await _controller.changeTeam(value.value);
      }, message: '選手データを取得中...');
    } catch (e) {
      if (mounted) {
        CommonFunctions.showErrorSnackBar(context, e.toString());
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);

    return Scaffold(
      appBar: const CustomAppMainBar(),
      body: Column(
        children: [
          // 検索エリア（データ取得完了時のみ表示）
          if (state is HomeStateLoaded)
            _buildSearchArea(state),
          // リスト表示エリア
          Expanded(
            child: switch (state) {
              HomeStateInitial() =>
                const Center(child: Text('データを読み込み中...')),
              HomeStateLoading() =>
                const Center(child: CircularProgressIndicator()),
              HomeStateLoaded(:final players) =>
                players.isEmpty
                  ? const Center(child: Text('データが見つかりません'))
                  : _buildPlayerList(players),
              HomeStateError(:final message) =>
                _buildErrorView(message),
            },
          ),
        ],
      ),
    );
  }

  /// 検索エリアの描画
  Widget _buildSearchArea(HomeStateLoaded state) {
    return Container(
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
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Column(
              children: [
                CustomSearchInput(
                  label: '選手名で検索',
                  callback: callbackHandleInput,
                ),
                const SizedBox(height: StyleConstants.sm),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    height: 35,
                    child: CustomSelectBox<int>(
                      selectList: state.seasons,
                      title: 'シーズンを選択してください',
                      callback: callbackChangeSeason,
                      backgroundColor: StyleConstants.lightGray,
                      textColor: StyleConstants.gray,
                    ),
                  ),
                  const SizedBox(width: StyleConstants.sm),
                  ...state.searchNames.map((name) =>
                    CustomTag(text: name, onTap: callbackHandleDeleteTag),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: StyleConstants.sm),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomSelectTag<int>(
                    selectList: state.teams,
                    callback: callbackChangeTeam,
                    selectionPrompt: 'チームを選択してください',
                    selectedValue: state.selectedTeam,
                    storageKey: 'home_team_select',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 選手一覧の描画
  Widget _buildPlayerList(List<RosterPlayer> players) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return _buildPlayerItem(player);
      },
    );
  }

  /// 選手リストアイテムの描画
  Widget _buildPlayerItem(RosterPlayer player) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: StyleConstants.sm,
        vertical: StyleConstants.xs,
      ),
      child: Padding(
        padding: const EdgeInsets.all(StyleConstants.sm),
        child: Row(
          children: [
            // 選手画像
            ClipRRect(
              borderRadius: BorderRadius.circular(StyleConstants.xs),
              child: player.imageUrl != null
                  ? Image.network(
                      player.imageUrl!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildEmptyImage(),
                    )
                  : _buildEmptyImage(),
            ),
            const SizedBox(width: StyleConstants.sm),
            // 選手情報
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '#${player.number ?? '-'}',
                        style: const TextStyle(
                          fontSize: StyleConstants.fontSizeSm,
                          fontWeight: FontWeight.bold,
                          color: StyleConstants.gray,
                        ),
                      ),
                      const SizedBox(width: StyleConstants.sm),
                      Expanded(
                        child: Text(
                          '${player.firstName} ${player.lastName}',
                          style: const TextStyle(
                            fontSize: StyleConstants.fontSizeNormal,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${player.age}歳',
                        style: const TextStyle(
                          fontSize: StyleConstants.fontSizeSm,
                          color: StyleConstants.gray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: StyleConstants.xs),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: StyleConstants.sm,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: StyleConstants.appColor,
                          borderRadius: BorderRadius.circular(StyleConstants.xs),
                        ),
                        child: Text(
                          player.positionName,
                          style: const TextStyle(
                            fontSize: StyleConstants.fontSizeXs,
                            color: StyleConstants.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: StyleConstants.sm),
                      Text(
                        player.rating != null
                            ? 'Rating: ${player.rating}'
                            : 'Rating: -',
                        style: const TextStyle(
                          fontSize: StyleConstants.fontSizeSm,
                          color: StyleConstants.darkGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 空画像の描画
  Widget _buildEmptyImage() {
    return Container(
      width: 50,
      height: 50,
      color: StyleConstants.lightGray,
      child: const Icon(
        Icons.person,
        color: StyleConstants.gray,
        size: 30,
      ),
    );
  }

  /// エラー表示
  Widget _buildErrorView(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          const SizedBox(height: StyleConstants.lg),
          ElevatedButton(
            onPressed: _initializeData,
            child: const Text('再試行'),
          ),
        ],
      ),
    );
  }
}
