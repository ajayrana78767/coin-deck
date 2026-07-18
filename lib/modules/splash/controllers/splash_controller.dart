import 'package:coin_deck/app/routes/app_routes.dart';
import 'package:coin_deck/services/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    _checkSession();
  }

  Future<void> _checkSession() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = _authService.getCurrentUser();

    if (user == null) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    Get.offAllNamed(AppRoutes.home);
  }
}
