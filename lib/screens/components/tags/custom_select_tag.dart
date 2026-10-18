import 'package:flutter/material.dart';
import 'package:nfl_library_app/consts/style_constants.dart';
import 'package:nfl_library_app/types/ui/i_select_box.dart';

/// タグ選択の検索欄
class CustomSelectTag<T> extends StatefulWidget {
  const CustomSelectTag({
    Key? key,
    required this.selectList,
    required this.callback,
    this.selectionPrompt = '選択してください',
    this.selectedValue,
    this.storageKey,
  }) : super(key: key);
  /// 検索内容の配列
  final List<ISelectBox<T>> selectList;
  /// 検索欄の説明書き
  final String selectionPrompt;
  /// 検索を実行するコールバック関数
  final void Function(ISelectBox<T>) callback;
  /// 選択中の値（未指定、または一致する項目が無い場合は先頭の項目を選択）
  final T? selectedValue;
  /// タグ一覧のスクロール位置を保存するキー（未指定の場合は保存しない）
  /// 同じ画面に複数配置する場合は、それぞれ異なる値を指定すること
  final String? storageKey;

  @override
  State<CustomSelectTag<T>> createState() => _CustomSelectTagState<T>();
}

/// タグ選択の検索欄の状態を管理するクラス
class _CustomSelectTagState<T> extends State<CustomSelectTag<T>> with SingleTickerProviderStateMixin {
  ISelectBox<T>? _selectedItem;
  bool _isExpanded = false;  // 展開状態を管理
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  // 選択中のチップ（展開時に表示範囲までスクロールするために使用）
  final GlobalKey _selectedChipKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _selectedItem = _findSelectedItem();
    
    // アニメーションコントローラーの初期化
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    // 展開アニメーション（0.0から1.0まで）
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // アニメーション完了時の処理
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed && mounted) {
        // 収納アニメーション完了時に状態をリセット
        setState(() {
          _isExpanded = false;
        });
      }
      if (status == AnimationStatus.completed && mounted) {
        // 展開完了時に選択中のチップが見えていなければ表示範囲までスクロール
        _scrollToSelectedChip();
      }
    });
  }

  @override
  void didUpdateWidget(covariant CustomSelectTag<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 親から渡された選択値・選択肢が変わった場合は選択中の項目を合わせる
    if (oldWidget.selectedValue != widget.selectedValue ||
        oldWidget.selectList != widget.selectList) {
      _selectedItem = _findSelectedItem();
    }
  }

  /// selectedValue に一致する項目を返す（無ければ先頭の項目、選択肢が空なら null）
  ISelectBox<T>? _findSelectedItem() {
    // widgetはState<T>を継承していることでプロパティが付与されており、そこに親ウィジェットから渡されたデータが格納されている
    if (widget.selectList.isEmpty) return null;
    return widget.selectList.firstWhere(
      (item) => item.value == widget.selectedValue,
      orElse: () => widget.selectList.first,
    );
  }

  /// 選択中のチップが表示範囲外の場合のみスクロールする
  /// スクロール位置が保存済みの場合は、ユーザーが操作した位置を優先してスクロールしない
  Future<void> _scrollToSelectedChip() async {
    final initialContext = _selectedChipKey.currentContext;
    if (initialContext == null) return;
    if (PageStorage.maybeOf(initialContext)?.readState(initialContext) != null) {
      return;
    }

    const duration = Duration(milliseconds: 200);
    // 右側にはみ出している場合は右端に、左側にはみ出している場合は左端に合わせる
    for (final policy in [
      ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      ScrollPositionAlignmentPolicy.keepVisibleAtStart,
    ]) {
      final chipContext = _selectedChipKey.currentContext;
      if (chipContext == null) return;
      await Scrollable.ensureVisible(
        chipContext,
        duration: duration,
        alignmentPolicy: policy,
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _expandAnimation,
      builder: (context, child) {
        return Column(
          children: [
            // 通常時は選択されたタグのみ表示
            _buildSelectedTag(),
            
            // 展開時は全てのタグを表示（アニメーション付き）
            SizeTransition(
              sizeFactor: _expandAnimation,
              child: FadeTransition(
                opacity: _expandAnimation,
                child: _isExpanded ? _buildExpandedTags() : const SizedBox.shrink(),
              ),
            ),
          ],
        );
      },
    );
  }

  /// 選択されたタグのみを表示するウィジェット
  Widget _buildSelectedTag() {
    if (_selectedItem == null) return const SizedBox.shrink();
    
    return GestureDetector(
      onTap: () {
        if (_isExpanded) {
          // 既に展開されている場合は収納
          _animationController.reverse();
        } else {
          // 展開されていない場合は展開
          setState(() {
            _isExpanded = true;
          });
          _animationController.forward();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: StyleConstants.md, vertical: StyleConstants.sm),
        decoration: BoxDecoration(
          color: StyleConstants.deepBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedItem!.imageFile != null) ...[
              Image.asset(
                _selectedItem!.imageFile!,
                width: 30,
              ),
              const SizedBox(width: StyleConstants.sm),
            ],
            Flexible(
              child: Text(
                _selectedItem!.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: StyleConstants.sm),
            AnimatedRotation(
              turns: _isExpanded ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 展開時の全タグ表示ウィジェット
  Widget _buildExpandedTags() {
    return Container(
      padding: const EdgeInsets.all(StyleConstants.md),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(StyleConstants.md),
      //   border: Border.all(color: Colors.grey[300]!),
      // ),
      child: Column(
        children: [
          Divider(
            thickness: 1,
            endIndent: 0,
            color: Colors.grey[300],
          ),
          const SizedBox(height: StyleConstants.md),
          // 閉じるボタン
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.selectionPrompt,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: StyleConstants.md,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // 収納アニメーションを開始
                  _animationController.reverse();
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: StyleConstants.md),
          // タグリスト
          SingleChildScrollView(
            // 閉じると破棄されるため、PageStorage にスクロール位置を保存して再表示時に復元する
            key: widget.storageKey != null
                ? PageStorageKey<String>(widget.storageKey!)
                : null,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.selectList
                  .map((item) => _buildFilterChip(item))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// 検索条件のチップを生成する
  Widget _buildFilterChip(ISelectBox<T> item) {
    final bool isSelected = _selectedItem?.value == item.value;
    return Container(
      key: isSelected ? _selectedChipKey : null,
      margin: const EdgeInsets.only(right: StyleConstants.sm),
      child: FilterChip(
        label: item.imageFile != null ? Row(
          children: [
            Image.asset(
              item.imageFile!,
              width: 30,
            ),
            const SizedBox(width: StyleConstants.sm),
            Text(
              item.text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ]
        ) : 
          Text(
            item.text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontWeight: FontWeight.w600,
            ),
          ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedItem = selected ? item : null;
            // コールバック関数を実行
            widget.callback(item);
          });
          // 収納アニメーションを開始
          _animationController.reverse();
        },
        backgroundColor: Colors.grey[200],
        selectedColor: const Color(0xFF1E3A8A),
        elevation: isSelected ? 3 : 0,
        showCheckmark: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}