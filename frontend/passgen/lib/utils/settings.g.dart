// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSettingsBoxAdapter extends TypeAdapter<HiveSettingsBox> {
  @override
  final int typeId = 0;

  @override
  HiveSettingsBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSettingsBox()
      ..alphabetsCount = fields[0] as int
      ..digitsCount = fields[1] as int
      ..specialCharactersCount = fields[2] as int
      ..length = fields[3] as int
      ..passwordCount = fields[4] as int;
  }

  @override
  void write(BinaryWriter writer, HiveSettingsBox obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.alphabetsCount)
      ..writeByte(1)
      ..write(obj.digitsCount)
      ..writeByte(2)
      ..write(obj.specialCharactersCount)
      ..writeByte(3)
      ..write(obj.length)
      ..writeByte(4)
      ..write(obj.passwordCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSettingsBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
