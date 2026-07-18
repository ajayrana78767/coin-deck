import 'package:coin_deck/app/routes/app_routes.dart';
import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final obscurePassword = true.obs;

  Future<void> login() async {
    isLoading.value = true;

    final user = await _authService.login(
      username: usernameController.text,
      password: passwordController.text,
    );

    isLoading.value = false;

    if (user == null) {
      Get.snackbar(AppStrings.loginFailed, AppStrings.invalidCredentials);
      return;
    }

    Get.offAllNamed(AppRoutes.home);
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
