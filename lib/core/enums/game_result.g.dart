// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameResultAdapter extends TypeAdapter<GameResult> {
  @override
  final int typeId = 2;

  @override
  GameResult read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GameResult.win;
      case 1:
        return GameResult.lose;
      default:
        return GameResult.win;
    }
  }

  @override
  void write(BinaryWriter writer, GameResult obj) {
    switch (obj) {
      case GameResult.win:
        writer.writeByte(0);
        break;
      case GameResult.lose:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
