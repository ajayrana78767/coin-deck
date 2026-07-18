import 'package:coin_deck/app/theme/app_colors.dart';
import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/core/constants/app_values.dart';
import 'package:coin_deck/modules/register/controllers/register_controller.dart';
import 'package:coin_deck/widgets/buttons/common_button.dart';
import 'package:coin_deck/widgets/cards/info_card.dart';
import 'package:coin_deck/widgets/inputs/common_text_field.dart';
import 'package:coin_deck/widgets/logo/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          AppStrings.createAccount,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppValues.paddingLarge),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppValues.spacingMedium),

                  const AppLogo(size: 70),

                  const SizedBox(height: 8),

                  const Text(
                   AppStrings.joinTheTable,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: AppValues.spacingExtraLarge),

                  InfoCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          AppStrings.createAccount,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: AppValues.spacingMedium),

                        CommonTextField(
                          controller: controller.usernameController,
                          labelText: AppStrings.username,
                          hintText: AppStrings.enterUsername,
                          prefixIcon: Icons.person_outline,
                          textInputAction: TextInputAction.next,
                        ),

                        const SizedBox(height: AppValues.spacingMedium),

                        CommonTextField(
                          controller: controller.passwordController,
                          labelText: AppStrings.password,
                          hintText: AppStrings.enterPassword,
                          obscureText: controller.obscurePassword.value,
                          prefixIcon: Icons.lock_outline,
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: controller.togglePasswordVisibility,
                            icon: Icon(
                              controller.obscurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),

                        const SizedBox(height: AppValues.spacingLarge),

                        CommonButton(
                          text: AppStrings.createAccount,
                          isLoading: controller.isLoading.value,
                          onPressed: controller.register,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
