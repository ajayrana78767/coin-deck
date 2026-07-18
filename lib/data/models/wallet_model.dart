import 'package:hive/hive.dart';

part 'wallet_model.g.dart';

@HiveType(typeId: 1)
class WalletModel extends HiveObject {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final double balance;

  WalletModel({required this.userId, required this.balance});

  WalletModel copyWith({String? userId, double? balance}) {
    return WalletModel(
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
    );
  }
}
