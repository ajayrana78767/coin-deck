import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/core/games/coin_flip_engine.dart';
import 'package:coin_deck/data/models/coin_flip_result.dart';
import 'package:coin_deck/modules/home/controllers/home_controller.dart';
import 'package:coin_deck/services/coin_flip_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinFlipController extends GetxController {
  CoinFlipController();

  final CoinFlipService _coinFlipService = Get.find<CoinFlipService>();
  final HomeController _homeController = Get.find<HomeController>();

  final TextEditingController betController = TextEditingController();

  final Rx<CoinSide> selectedSide = CoinSide.heads.obs;
  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    betController.dispose();
    super.onClose();
  }

  Future<void> playGame() async {
    final user = _homeController.currentUser.value;

    if (user == null) {
      return;
    }

    final double? betAmount = double.tryParse(betController.text.trim());

    if (betAmount == null || betAmount <= 0) {
      Get.snackbar('Invalid Bet', 'Bet amount must be greater than zero.');
      return;
    }

    isLoading.value = true;

    try {
      final CoinFlipResult result = await _coinFlipService.play(
        userId: user.id,
        betAmount: betAmount,
        selectedSide: selectedSide.value,
      );

      _homeController.refreshWallet();

      resetForm();

      showResult(result);
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');

      Get.snackbar('Error', message);
    } finally {
      isLoading.value = false;
    }
  }

  void resetForm() {
    betController.clear();
    selectedSide.value = CoinSide.heads;
  }

  void showResult(CoinFlipResult result) {
    Get.defaultDialog(
      title: result.isWin
          ? AppStrings.dialogWinTitle
          : AppStrings.dialogLoseTitle,
      middleText:
          '''
${AppStrings.selectedSideLabel}${result.selectedSide.name.toUpperCase()}

${AppStrings.resultSideLabel}${result.resultSide.name.toUpperCase()}

${AppStrings.betAmountLabel}${result.betAmount}

${AppStrings.payoutLabel}${result.payout}

${AppStrings.currentBalanceLabel}${result.balance}
''',
      textConfirm: AppStrings.ok,
      onConfirm: Get.back,
    );
  }
}
