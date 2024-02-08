// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FutureEventAdapter extends TypeAdapter<FutureEvent> {
  @override
  final int typeId = 0;

  @override
  FutureEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FutureEvent(
      date: fields[0] as DateTime?,
      title: fields[2] as String,
      unit: fields[3] as String,
      createdAt: fields[4] as DateTime,
      imagePath: fields[1] as String?,
      done: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FutureEvent obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.unit)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FutureEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomUnitEventAdapter extends TypeAdapter<CustomUnitEvent> {
  @override
  final int typeId = 1;

  @override
  CustomUnitEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomUnitEvent(
      title: fields[2] as String,
      createdAt: fields[4] as DateTime,
      unitName: fields[6] as String,
      amountRequired: fields[7] as int,
      imagePath: fields[1] as String?,
    )
      ..date = fields[0] as DateTime?
      ..unit = fields[3] as String
      ..done = fields[5] as bool;
  }

  @override
  void write(BinaryWriter writer, CustomUnitEvent obj) {
    writer
      ..writeByte(8)
      ..writeByte(6)
      ..write(obj.unitName)
      ..writeByte(7)
      ..write(obj.amountRequired)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.unit)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomUnitEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProgressRecordAdapter extends TypeAdapter<ProgressRecord> {
  @override
  final int typeId = 2;

  @override
  ProgressRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgressRecord(
      amount: fields[0] as int,
      timestamp: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProgressRecord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
