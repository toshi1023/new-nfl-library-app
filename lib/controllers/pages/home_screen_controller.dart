import 'package:nfl_library_app/types/ui/i_select_box.dart';

/// ホーム画面のコントローラー
class HomeScreenController {

  HomeScreenController();

  /// シーズン情報を取得
  Future<List<ISelectBox<int>>> fetchSeasonList() async {
    return [
      ISelectBox<int>(value: 2012, text: '2012年', shortText: '2012年'),
      ISelectBox<int>(value: 2013, text: '2013年', shortText: '2013年'),
      ISelectBox<int>(value: 2014, text: '2014年', shortText: '2014年'),
    ];
  }

  /// チーム情報を取得
  Future<List<ISelectBox<int>>> fetchTeamList() async {
    return [
      ISelectBox<int>(value: 1, text: 'San Francisco 49ers', shortText: 'San Francisco', imageFile: 'images/logos/49ers.gif'),
      ISelectBox<int>(value: 2, text: 'Kansas City Chiefs', shortText: 'Kansas City', imageFile: 'images/logos/chiefs.gif'),
      ISelectBox<int>(value: 3, text: 'Green Bay Packers', shortText: 'Green Bay', imageFile: 'images/logos/packers.gif'),
    ];
  }
}