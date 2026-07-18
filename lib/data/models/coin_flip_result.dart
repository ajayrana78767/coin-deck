import 'package:coin_deck/core/games/coin_flip_engine.dart';

class CoinFlipResult {
  final bool isWin;
  final CoinSide selectedSide;
  final CoinSide resultSide;
  final double betAmount;
  final double payout;
  final double balance;

  const CoinFlipResult({
    required this.isWin,
    required this.selectedSide,
    required this.resultSide,
    required this.betAmount,
    required this.payout,
    required this.balance,
  });
}
