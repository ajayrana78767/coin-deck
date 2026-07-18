import 'package:coin_deck/app/bindings/initial_binding.dart';
import 'package:coin_deck/app/routes/app_pages.dart';
import 'package:coin_deck/app/routes/app_routes.dart';
import 'package:coin_deck/app/theme/app_theme.dart';
import 'package:coin_deck/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinDeckApp extends StatelessWidget {
  const CoinDeckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.theme,
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
