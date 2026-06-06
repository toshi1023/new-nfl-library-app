/// ラベルなしのセレクトボックス

import 'package:flutter/material.dart';
import 'package:nfl_library_app/consts/style_constants.dart';
import 'package:nfl_library_app/types/ui/i_select_box.dart';

class CustomSelectBox<T> extends StatefulWidget {
  const CustomSelectBox({
    Key? key,
    required this.selectList,
    required this.title,
    required this.callback,
    this.backgroundColor,
    this.textColor,
    this.fontSize
  }) : super(key: key);
  final List<ISelectBox<T>> selectList;
  final String title;
  final void Function(ISelectBox<T>) callback;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  @override
  State<CustomSelectBox<T>> createState() => _CustomSelectBoxState<T>();
}

class _CustomSelectBoxState<T> extends State<CustomSelectBox<T>> {
  // growable: trueにするとリストの拡張が可能になる
  // final List<DropdownMenuItem<int>> _items = List.empty(growable: true);
  T? _selectItem;

  @override
  void initState() {
    super.initState();
    _selectItem = widget.selectList[0].value;
  }

  /// ドロップダウンリストのwidgetを生成
  Widget _generateDropdownMenuItem(ISelectBox data, {Color? textColor, bool isShort = false}) {
    return DropdownMenuItem(
      value: data.value,
      child: data.imageFile == null ?
      // テキストのみの場合
      Center(child: Text(data.shortText != null && isShort ? data.shortText! : data.text, style: TextStyle(fontSize: widget.fontSize ?? 14, color: textColor ?? Colors.white, fontWeight: FontWeight.bold)))
          :
      // アイコン画像の設定をする場合
      Row(
        children: <Widget> [
          Container(
            margin: const EdgeInsets.all(StyleConstants.sm),
            child: Image.asset(
              data.imageFile!,
              width: 30,
            ),
          ),
          Text(
              data.shortText != null && isShort ? data.shortText! : data.text,
              style: TextStyle(fontSize: widget.fontSize ?? 14, color: textColor ?? Colors.white, fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: StyleConstants.lg, vertical: StyleConstants.sm),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? StyleConstants.appColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: // ドロップダウンリストに表示する値
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _generateDropdownMenuItem(widget.selectList.firstWhere((element) => element.value == _selectItem), textColor: widget.textColor, isShort: true),
              // 三角のアイコン
              Icon(Icons.arrow_drop_down, color: widget.textColor ?? Colors.white),
            ],
          ),
        ),
        onTap: () async {
          await showModalBottomSheet(
            //モーダルの背景の色、透過
            backgroundColor: Colors.transparent,
            //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return Container(
                      margin: const EdgeInsets.only(top: 120),
                      decoration: const BoxDecoration(
                        //モーダル自体の色
                        color: Colors.white,
                        //角丸にする
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // 閉じるボタン
                            InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(StyleConstants.xl),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.close,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),

                            // メニュータイトル
                            Center(
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                    fontSize: StyleConstants.md,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bree_Serif'
                                ),
                              ),
                            ),

                            // データ一覧
                            ListView.builder(
                              // 要素の高さに合わせてどうこう調整してくれるもの
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),

                                itemCount: widget.selectList.length,
                                itemBuilder: (context, index) {
                                  final data = widget.selectList[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: StyleConstants.sm),
                                    child: _buildFilterChipWithModal(data, setModalState)
                                  );
                                }
                            ),
                          ],
                        ),
                      )
                  );
                }
              );
            });
        }
    );
  }

  /// ハーフモーダルに表示するリストのウィジェットを生成（Modal状態更新対応）
  Widget _buildFilterChipWithModal(ISelectBox<T> selectItem, StateSetter setModalState) {
    bool isSelected = _selectItem == selectItem.value;
    return FilterChip(
      label: Text(
        selectItem.text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        // 両方の状態を更新
        setState(() {
          _selectItem = selectItem.value;
        });
        setModalState(() {
          _selectItem = selectItem.value;
        });
        widget.callback(selectItem);
        Navigator.pop(context);
      },
      backgroundColor: StyleConstants.lightGray,
      selectedColor: StyleConstants.appColor,
      elevation: isSelected ? 3 : 0,
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}