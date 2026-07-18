import 'package:coin_deck/app/theme/app_colors.dart';
import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:coin_deck/core/enums/game_result.dart';
import 'package:coin_deck/modules/history/controllers/history_controller.dart';
import 'package:coin_deck/widgets/cards/info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          AppStrings.gameHistory,
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
          child: Obx(() {
            if (controller.history.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 56,
                      color: AppColors.textMuted.withValues(alpha: 0.6),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      AppStrings.noGameHistory,
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              itemCount: controller.history.length,
              separatorBuilder: (context, index) =>  SizedBox(height: 12),
              itemBuilder: (context, index) {
                final history = controller.history[index];
                final isWin = history.result == GameResult.win;
                final resultColor = isWin
                    ? AppColors.success
                    : AppColors.error;

                return InfoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              history.game,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: resultColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: resultColor.withValues(alpha: 0.4),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isWin
                                      ? Icons.trending_up_rounded
                                      : Icons.trending_down_rounded,
                                  size: 14,
                                  color: resultColor,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  isWin ? AppStrings.win : AppStrings.lose,
                                  style: TextStyle(
                                    color: resultColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      Divider(color: Colors.white.withValues(alpha: 0.06), height: 1),

                      const SizedBox(height: 10),

                      _buildRow(AppStrings.betAmount, '₹${history.betAmount}'),
                      _buildRow(
                        AppStrings.winAmount,
                        '₹${history.winAmount}',
                        valueColor: isWin ? AppColors.success : null,
                      ),
                      _buildRow(
                        AppStrings.balance,
                        '₹${history.balanceAfterBet}',
                      ),
                      _buildRow(
                        AppStrings.playedOn,
                        DateFormat(
                          'dd MMM yyyy, hh:mm a',
                        ).format(history.createdAt),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: valueColor ?? AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}