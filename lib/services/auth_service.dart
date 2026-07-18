import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/data/models/user_model.dart';
import 'package:coin_deck/data/models/wallet_model.dart';
import 'package:coin_deck/data/repositories/auth_repository.dart';
import 'package:coin_deck/data/repositories/session_repository.dart';
import 'package:coin_deck/data/repositories/wallet_repository.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:coin_deck/core/constants/app_constants.dart';

class AuthService {
  AuthService();

  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final WalletRepository _walletRepository = Get.find<WalletRepository>();
  final SessionRepository _sessionRepository = Get.find<SessionRepository>();

  final Uuid _uuid = const Uuid();

  Future<String?> register({
    required String username,
    required String password,
  }) async {
    username = username.trim();
    password = password.trim();

    if (username.isEmpty) {
      return AppStrings.usernameRequired;
    }

    if (password.isEmpty) {
      return AppStrings.passwordRequired;
    }

    final existingUser = _authRepository.getUserByUsername(username);

    if (existingUser != null) {
      return AppStrings.usernameAlreadyExists;
    }

    final user = UserModel(
      id: _uuid.v4(),
      username: username,
      password: password,
      createdAt: DateTime.now(),
    );

    final wallet = WalletModel(
      userId: user.id,
      balance: AppConstants.initialBalance,
    );

    try {
      await _authRepository.saveUser(user);
      await _walletRepository.saveWallet(wallet);

      return null;
    } catch (_) {
      return AppStrings.somethingWentWrong;
    }
  }

  Future<UserModel?> login({
    required String username,
    required String password,
  }) async {
    username = username.trim();
    password = password.trim();

    if (username.isEmpty || password.isEmpty) {
      return null;
    }

    final user = _authRepository.getUserByUsername(username);

    if (user == null) {
      return null;
    }

    if (user.password != password) {
      return null;
    }

    await _sessionRepository.saveCurrentUserId(user.id);

    return user;
  }

  Future<void> logout() async {
    await _sessionRepository.clearSession();
  }

  UserModel? getCurrentUser() {
    final userId = _sessionRepository.getCurrentUserId();

    if (userId == null) {
      return null;
    }

    return _authRepository.getUserById(userId);
  }
}
