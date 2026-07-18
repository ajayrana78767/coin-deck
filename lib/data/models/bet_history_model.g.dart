// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BetHistoryModelAdapter extends TypeAdapter<BetHistoryModel> {
  @override
  final int typeId = 3;

  @override
  BetHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BetHistoryModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      game: fields[2] as String,
      betAmount: fields[3] as double,
      winAmount: fields[4] as double,
      balanceAfterBet: fields[5] as double,
      result: fields[6] as GameResult,
      createdAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BetHistoryModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.game)
      ..writeByte(3)
      ..write(obj.betAmount)
      ..writeByte(4)
      ..write(obj.winAmount)
      ..writeByte(5)
      ..write(obj.balanceAfterBet)
      ..writeByte(6)
      ..write(obj.result)
      ..writeByte(7)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BetHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
