import 'dart:math';

enum CoinSide { heads, tails }

class CoinFlipEngine {
  CoinFlipEngine({Random? random}) : _random = random ?? Random();

  final Random _random;

  CoinSide flip() {
    return _random.nextBool() ? CoinSide.heads : CoinSide.tails;
  }

  bool isWinner({required CoinSide selectedSide, required CoinSide result}) {
    return selectedSide == result;
  }
}
