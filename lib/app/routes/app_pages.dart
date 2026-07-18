import 'package:coin_deck/app/routes/app_routes.dart';
import 'package:coin_deck/modules/coin_flip/bindings/coin_flip_binding.dart';
import 'package:coin_deck/modules/coin_flip/views/coin_flip_view.dart';
import 'package:coin_deck/modules/history/bindings/history_binding.dart';
import 'package:coin_deck/modules/history/views/history_view.dart';
import 'package:coin_deck/modules/home/bindings/home_binding.dart';
import 'package:coin_deck/modules/home/views/home_view.dart';
import 'package:coin_deck/modules/login/bindings/login_binding.dart';
import 'package:coin_deck/modules/login/views/login_view.dart';
import 'package:coin_deck/modules/register/bindings/register_binding.dart';
import 'package:coin_deck/modules/register/views/register_view.dart';
import 'package:coin_deck/modules/splash/bindings/splash_binding.dart';
import 'package:coin_deck/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.coinFlip,
      page: () => const CoinFlipView(),
      binding: CoinFlipBinding(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
  ];
}
