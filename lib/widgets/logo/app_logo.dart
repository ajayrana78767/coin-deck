import 'package:coin_deck/app/theme/app_colors.dart';
import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 90, this.showTitle = true});

  final double size;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.goldGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.withValues(alpha: 0.4),
                blurRadius: 26,
                spreadRadius: 2,
              ),
            ],
          ),
         child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: size * 0.70,
              height: size * 0.70,
              fit: BoxFit.contain,
            ),
          ),
         
        ),

        if (showTitle) ...[
          const SizedBox(height: 14),
          Text(
            AppStrings.appName,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ],
    );
  }
}
