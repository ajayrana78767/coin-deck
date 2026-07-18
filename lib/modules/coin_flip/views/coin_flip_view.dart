import 'package:coin_deck/app/theme/app_colors.dart';
import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/core/games/coin_flip_engine.dart';
import 'package:coin_deck/modules/coin_flip/controllers/coin_flip_controller.dart';
import 'package:coin_deck/widgets/buttons/common_button.dart';
import 'package:coin_deck/widgets/cards/info_card.dart';
import 'package:coin_deck/widgets/inputs/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinFlipView extends GetView<CoinFlipController> {
  const CoinFlipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          AppStrings.coinFlip,
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
          child: Obx(
            () => SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.goldGradient,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gold.withValues(alpha: 0.4),
                          blurRadius: 30,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.casino,
                      size: 56,
                      color: AppColors.onGold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    AppStrings.headsOrTails,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 26),

                  InfoCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee_rounded,
                              color: AppColors.gold,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              AppStrings.betAmount,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        CommonTextField(
                          controller: controller.betController,
                          hintText: AppStrings.enterBetAmount,
                          keyboardType: TextInputType.number,
                          prefixIcon: Icons.currency_rupee,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  InfoCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.chooseSide,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Row(
                          children: [
                            Expanded(
                              child: _SideOption(
                                label: AppStrings.heads,
                                icon: Icons.circle_outlined,
                                selected:
                                    controller.selectedSide.value ==
                                    CoinSide.heads,
                                onTap: () => controller
                                    .selectedSide
                                    .value = CoinSide.heads,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _SideOption(
                                label: AppStrings.tails,
                                icon: Icons.circle,
                                selected:
                                    controller.selectedSide.value ==
                                    CoinSide.tails,
                                onTap: () => controller
                                    .selectedSide
                                    .value = CoinSide.tails,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  CommonButton(
                    text: AppStrings.playGame,
                    icon: Icons.play_arrow,
                    isLoading: controller.isLoading.value,
                    onPressed: controller.playGame,
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

class _SideOption extends StatelessWidget {
  const _SideOption({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: selected ? AppColors.goldGradient : null,
          color: selected ? null : AppColors.surface,
          border: Border.all(
            color: selected
                ? Colors.transparent
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 26,
              color: selected ? AppColors.onGold : AppColors.textSecondary,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: selected ? AppColors.onGold : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}