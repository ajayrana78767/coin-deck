import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/core/constants/game_constants.dart';
import 'package:coin_deck/core/enums/game_result.dart';
import 'package:coin_deck/core/games/coin_flip_engine.dart';
import 'package:coin_deck/data/models/bet_history_model.dart';
import 'package:coin_deck/data/models/coin_flip_result.dart';
import 'package:coin_deck/data/models/wallet_model.dart';
import 'package:coin_deck/data/repositories/history_repository.dart';
import 'package:coin_deck/services/wallet_service.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CoinFlipService {
  CoinFlipService();

  final WalletService _walletService = Get.find<WalletService>();
  final HistoryRepository _historyRepository = Get.find<HistoryRepository>();

  final CoinFlipEngine _engine = CoinFlipEngine();

  final Uuid _uuid = const Uuid();

  Future<CoinFlipResult> play({
    required String userId,
    required double betAmount,
    required CoinSide selectedSide,
  }) async {
    if (betAmount <= 0) {
      throw Exception(AppStrings.errBetGreaterThanZero);
    }

    final WalletModel? wallet = _walletService.getWallet(userId);

    if (wallet == null) {
      throw Exception(AppStrings.walletNotFound);
    }

    if (wallet.balance < betAmount) {
      throw Exception(AppStrings.insufficientBalance);
    }

    double currentBalance = wallet.balance - betAmount;

    final CoinSide resultSide = _engine.flip();

    final bool isWin = _engine.isWinner(
      selectedSide: selectedSide,
      result: resultSide,
    );

    double payout = 0;

    if (isWin) {
      payout = betAmount * 2;
      currentBalance += payout;
    }

    await _walletService.updateBalance(
      userId: userId,
      newBalance: currentBalance,
    );

    await _historyRepository.addHistory(
      BetHistoryModel(
        id: _uuid.v4(),
        userId: userId,
        game: GameConstants.coinFlip,
        betAmount: betAmount,
        winAmount: payout,
        balanceAfterBet: currentBalance,
        result: isWin ? GameResult.win : GameResult.lose,
        createdAt: DateTime.now(),
      ),
    );

    return CoinFlipResult(
      isWin: isWin,
      selectedSide: selectedSide,
      resultSide: resultSide,
      betAmount: betAmount,
      payout: payout,
      balance: currentBalance,
    );
  }
}
