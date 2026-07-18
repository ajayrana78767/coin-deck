import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;
  final obscurePassword = true.obs;

  Future<void> register() async {
    isLoading.value = true;

    final error = await _authService.register(
      username: usernameController.text,
      password: passwordController.text,
    );

    isLoading.value = false;

    if (error != null) {
      Get.snackbar(AppStrings.registrationFailed, error);
      return;
    }

    Get.back();

    Get.snackbar(AppStrings.success, AppStrings.accountCreatedSuccessfully);
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
