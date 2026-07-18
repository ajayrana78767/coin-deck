import 'package:coin_deck/data/local/hive_service.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SessionRepository {
  final HiveService _hiveService = Get.find<HiveService>();

  Box<String> get _sessionBox => _hiveService.sessionBox;

  static const String _currentUserKey = 'current_user';

  Future<void> saveCurrentUserId(String userId) async {
    await _sessionBox.put(_currentUserKey, userId);
  }

  String? getCurrentUserId() {
    return _sessionBox.get(_currentUserKey);
  }

  Future<void> clearSession() async {
    await _sessionBox.delete(_currentUserKey);
  }
}
