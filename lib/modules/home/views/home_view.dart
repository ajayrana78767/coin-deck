import 'package:coin_deck/app/theme/app_colors.dart';
import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/modules/home/controllers/home_controller.dart';
import 'package:coin_deck/widgets/buttons/common_button.dart';
import 'package:coin_deck/widgets/buttons/common_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  String _initial(String? username) {
    if (username == null || username.isEmpty) return '?';
    return username.substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.goldGradient,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _initial(controller.currentUser.value?.username),
                          style: const TextStyle(
                            color: AppColors.onGold,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              AppStrings.welcome,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              controller.currentUser.value?.username ?? '',
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      gradient: AppColors.goldGradient,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gold.withValues(alpha: 0.35),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.account_balance_wallet_rounded,
                              color: AppColors.onGold,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              AppStrings.walletBalance,
                              style: TextStyle(
                                color: AppColors.onGold,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          '${controller.wallet.value?.balance ?? 0}',
                          style: const TextStyle(
                            color: AppColors.onGold,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                             AppStrings.coins,                          
                            style: TextStyle(
                            color: Color(0xB30F1225),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  CommonButton(
                    text: '${AppStrings.play} ${AppStrings.coinFlip}',
                    icon: Icons.casino,
                    onPressed: controller.goToCoinFlip,
                  ),

                  const SizedBox(height: 14),

                  CommonOutlineButton(
                    text: AppStrings.history,
                    icon: Icons.history,
                    color: AppColors.textPrimary,
                    onPressed: controller.goToHistory,
                  ),

                  const SizedBox(height: 14),

                  CommonOutlineButton(
                    text: AppStrings.logout,
                    icon: Icons.logout,
                    color: AppColors.error,
                    onPressed: controller.logout,
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
