import 'package:flutter/material.dart';
import 'package:nfl_library_app/consts/style_constants.dart';
import 'package:nfl_library_app/screens/components/buttons/custom_button.dart';

/// 検索の入力欄
class CustomSearchInput extends StatefulWidget {
  const CustomSearchInput({
    Key? key,
    this.label = '検索',
    required this.callback
  }) : super(key: key);
  /// 検索欄のラベル
  final String label;
  /// 検索を実行するコールバック関数
  final void Function(String) callback;

  @override
  State<CustomSearchInput> createState() => _CustomSearchInputState();
}

class _CustomSearchInputState extends State<CustomSearchInput> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TextFieldを可変幅にする(SizedBoxとElevatedButtonのスペースを除いた残りの幅を活用する)
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(StyleConstants.lg),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: TextField(
              // テキストフィールドは独自の内部状態をもつ為、コントローラーを介して管理が必要
              controller: _textController,
              decoration: InputDecoration(
                hintText: widget.label,
                hintStyle: const TextStyle(color: StyleConstants.gray),
                prefixIcon: const Icon(Icons.search, color: StyleConstants.gray),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: StyleConstants.sm), // 間隔を追加
        CustomButton(
          text: '検索',
          width: 80, // 明示的に幅を指定
          height: 40, // 高さも統一
          isRounded: true,
          // 検索処理を実行
          onPressed: () {
            widget.callback(_textController.text);
            // TextFieldの内容をクリア
            _textController.clear();
          },
        )
      ],
    );
  }
}