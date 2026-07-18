import 'package:coin_deck/app/routes/app_routes.dart';
import 'package:coin_deck/data/models/user_model.dart';
import 'package:coin_deck/data/models/wallet_model.dart';
import 'package:coin_deck/services/auth_service.dart';
import 'package:coin_deck/services/wallet_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final WalletService _walletService = Get.find<WalletService>();

  final Rxn<UserModel> currentUser = Rxn<UserModel>();
  final Rxn<WalletModel> wallet = Rxn<WalletModel>();

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() {
    final user = _authService.getCurrentUser();

    if (user == null) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    currentUser.value = user;
    wallet.value = _walletService.getWallet(user.id);
  }

  void refreshWallet() {
    final user = currentUser.value;

    if (user == null) return;

    wallet.value = _walletService.getWallet(user.id);
  }

  Future<void> logout() async {
    await _authService.logout();
    Get.offAllNamed(AppRoutes.login);
  }

  void goToCoinFlip() async {
    await Get.toNamed(AppRoutes.coinFlip);

    refreshWallet();
  }

  void goToHistory() {
    Get.toNamed(AppRoutes.history);
  }
}
