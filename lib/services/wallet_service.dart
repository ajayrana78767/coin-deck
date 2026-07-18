import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/data/models/wallet_model.dart';
import 'package:coin_deck/data/repositories/wallet_repository.dart';
import 'package:get/get.dart';

class WalletService {
  WalletService();

  final WalletRepository _walletRepository = Get.find<WalletRepository>();

  WalletModel? getWallet(String userId) {
    return _walletRepository.getWallet(userId);
  }

  Future<void> saveWallet(WalletModel wallet) async {
    await _walletRepository.saveWallet(wallet);
  }

  Future<void> updateBalance({
    required String userId,
    required double newBalance,
  }) async {
    final wallet = _walletRepository.getWallet(userId);

    if (wallet == null) {
      throw Exception(AppStrings.walletNotFound);
    }

    final updatedWallet = WalletModel(
      userId: wallet.userId,
      balance: newBalance,
    );

    await _walletRepository.saveWallet(updatedWallet);
  }

  bool hasSufficientBalance({required String userId, required double amount}) {
    final wallet = _walletRepository.getWallet(userId);

    if (wallet == null) {
      return false;
    }

    return wallet.balance >= amount;
  }
}
