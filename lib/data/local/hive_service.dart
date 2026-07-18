import 'package:coin_deck/core/enums/game_result.dart';
import 'package:coin_deck/data/local/hive_boxes.dart';
import 'package:coin_deck/data/models/bet_history_model.dart';
import 'package:coin_deck/data/models/user_model.dart';
import 'package:coin_deck/data/models/wallet_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(WalletModelAdapter());
    Hive.registerAdapter(GameResultAdapter());
    Hive.registerAdapter(BetHistoryModelAdapter());

    await Hive.openBox<UserModel>(HiveBoxes.user);
    await Hive.openBox<WalletModel>(HiveBoxes.wallet);
    await Hive.openBox<BetHistoryModel>(HiveBoxes.history);
    await Hive.openBox<String>(HiveBoxes.session);
  }

  Box<UserModel> get userBox => Hive.box<UserModel>(HiveBoxes.user);

  Box<WalletModel> get walletBox => Hive.box<WalletModel>(HiveBoxes.wallet);

  Box<BetHistoryModel> get historyBox =>
      Hive.box<BetHistoryModel>(HiveBoxes.history);
  
  Box<String> get sessionBox => Hive.box<String>(HiveBoxes.session);
}
