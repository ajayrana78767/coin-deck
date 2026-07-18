import 'package:hive/hive.dart';

part 'game_result.g.dart';

@HiveType(typeId: 2)
enum GameResult {
  @HiveField(0)
  win,

  @HiveField(1)
  lose,
}
