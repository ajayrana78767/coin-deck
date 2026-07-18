import 'package:coin_deck/app/app.dart';
import 'package:coin_deck/data/local/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hiveService = HiveService();
  await hiveService.init();

  Get.put<HiveService>(hiveService, permanent: true);

  runApp(const CoinDeckApp());
}
