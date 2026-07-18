import 'package:coin_deck/data/models/bet_history_model.dart';
import 'package:coin_deck/modules/home/controllers/home_controller.dart';
import 'package:coin_deck/data/repositories/history_repository.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final HistoryRepository _historyRepository = Get.find<HistoryRepository>();

  final HomeController _homeController = Get.find<HomeController>();

  final RxList<BetHistoryModel> history = <BetHistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadHistory();
  }

  void loadHistory() {
    final user = _homeController.currentUser.value;

    if (user == null) {
      return;
    }

    history.assignAll(_historyRepository.getHistory(user.id));
  }
}
