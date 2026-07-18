import 'package:coin_deck/app/theme/app_colors.dart';
import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/core/constants/app_values.dart';
import 'package:coin_deck/modules/splash/controllers/splash_controller.dart';
import 'package:coin_deck/widgets/logo/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppValues.paddingLarge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(size: 110, showTitle: false),

                  const SizedBox(height: AppValues.spacingLarge),

                  const Text(
                    AppStrings.appName,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    AppStrings.loadingYourTable,
                    style: TextStyle(color: AppColors.textMuted, fontSize: 13),
                  ),

                  const SizedBox(height: AppValues.spacingExtraLarge),

                  const SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.gold),
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
