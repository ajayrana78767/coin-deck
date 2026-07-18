import 'package:coin_deck/data/local/hive_service.dart';
import 'package:coin_deck/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthRepository {
  final HiveService _hiveService = Get.find<HiveService>();

  Box<UserModel> get _userBox => _hiveService.userBox;

  Future<void> saveUser(UserModel user) async {
    await _userBox.put(user.id, user);
  }

  UserModel? getUserById(String id) {
    return _userBox.get(id);
  }

  UserModel? getUserByUsername(String username) {
    try {
      return _userBox.values.firstWhere((user) => user.username == username);
    } catch (_) {
      return null;
    }
  }

  Future<void> deleteUser(String id) async {
    await _userBox.delete(id);
  }

  List<UserModel> getAllUsers() {
    return _userBox.values.toList();
  }
}
