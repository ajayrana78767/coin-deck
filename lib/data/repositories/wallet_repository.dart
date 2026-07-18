import 'package:coin_deck/data/local/hive_service.dart';
import 'package:coin_deck/data/models/wallet_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WalletRepository {
  final HiveService _hiveService = Get.find<HiveService>();

  Box<WalletModel> get _walletBox => _hiveService.walletBox;

  Future<void> saveWallet(WalletModel wallet) async {
    await _walletBox.put(wallet.userId, wallet);
  }

  WalletModel? getWallet(String userId) {
    return _walletBox.get(userId);
  }

  Future<void> updateWallet(WalletModel wallet) async {
    await _walletBox.put(wallet.userId, wallet);
  }

  Future<void> deleteWallet(String userId) async {
    await _walletBox.delete(userId);
  }
}
