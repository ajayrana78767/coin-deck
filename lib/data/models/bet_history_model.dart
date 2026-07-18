import 'package:coin_deck/core/enums/game_result.dart';
import 'package:hive/hive.dart';

part 'bet_history_model.g.dart';

@HiveType(typeId: 3)
class BetHistoryModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String game;

  @HiveField(3)
  final double betAmount;

  @HiveField(4)
  final double winAmount;

  @HiveField(5)
  final double balanceAfterBet;

  @HiveField(6)
  final GameResult result;

  @HiveField(7)
  final DateTime createdAt;

  BetHistoryModel({
    required this.id,
    required this.userId,
    required this.game,
    required this.betAmount,
    required this.winAmount,
    required this.balanceAfterBet,
    required this.result,
    required this.createdAt,
  });

  BetHistoryModel copyWith({
    String? id,
    String? userId,
    String? game,
    double? betAmount,
    double? winAmount,
    double? balanceAfterBet,
    GameResult? result,
    DateTime? createdAt,
  }) {
    return BetHistoryModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      game: game ?? this.game,
      betAmount: betAmount ?? this.betAmount,
      winAmount: winAmount ?? this.winAmount,
      balanceAfterBet: balanceAfterBet ?? this.balanceAfterBet,
      result: result ?? this.result,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
