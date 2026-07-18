import 'package:coin_deck/modules/coin_flip/controllers/coin_flip_controller.dart';
import 'package:get/get.dart';

class CoinFlipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoinFlipController>(() => CoinFlipController());
  }
}
