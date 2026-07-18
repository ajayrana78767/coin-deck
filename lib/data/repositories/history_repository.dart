import 'package:coin_deck/data/local/hive_service.dart';
import 'package:coin_deck/data/models/bet_history_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryRepository {
  final HiveService _hiveService = Get.find<HiveService>();

  Box<BetHistoryModel> get _historyBox => _hiveService.historyBox;

  Future<void> addHistory(BetHistoryModel history) async {
    await _historyBox.put(history.id, history);
  }

  List<BetHistoryModel> getHistory(String userId) {
    return _historyBox.values
        .where((history) => history.userId == userId)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> clearHistory() async {
    await _historyBox.clear();
  }
}
