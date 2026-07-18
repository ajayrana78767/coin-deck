import 'package:coin_deck/data/repositories/auth_repository.dart';
import 'package:coin_deck/data/repositories/history_repository.dart';
import 'package:coin_deck/data/repositories/session_repository.dart';
import 'package:coin_deck/data/repositories/wallet_repository.dart';
import 'package:coin_deck/services/auth_service.dart';
import 'package:coin_deck/services/coin_flip_service.dart';
import 'package:coin_deck/services/wallet_service.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository(), fenix: true);

    Get.lazyPut<WalletRepository>(() => WalletRepository(), fenix: true);

    Get.lazyPut<HistoryRepository>(() => HistoryRepository(), fenix: true);

    Get.lazyPut<SessionRepository>(() => SessionRepository(), fenix: true);
    
    Get.lazyPut<AuthService>(() => AuthService(), fenix: true);

    Get.lazyPut<WalletService>(() => WalletService(), fenix: true);

    Get.lazyPut<CoinFlipService>(() => CoinFlipService(), fenix: true);
  }
}
