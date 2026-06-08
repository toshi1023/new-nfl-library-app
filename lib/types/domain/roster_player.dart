/// ロスター選手のドメインモデル
/// APIレスポンスから変換された、Screen表示用の型
class RosterPlayer {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String? imageUrl;
  final int number;
  final int? rating;
  final String positionName;

  const RosterPlayer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    this.imageUrl,
    required this.number,
    this.rating,
    required this.positionName,
  });
}
