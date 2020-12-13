// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_received_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationPackageExtraAdapter
    extends TypeAdapter<NotificationPackageExtra> {
  @override
  final int typeId = 0;

  @override
  NotificationPackageExtra read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationPackageExtra(
      androidTitle: fields[0] as String,
      androidSubText: fields[1] as dynamic,
      androidTemplate: fields[2] as String,
      androidShowChronometer: fields[3] as bool,
      androidIcon: fields[4] as int,
      androidText: fields[5] as String,
      androidProgress: fields[6] as int,
      androidProgressMax: fields[7] as int,
      androidShowWhen: fields[8] as bool,
      androidBigText: fields[9] as String,
      androidInfoText: fields[10] as dynamic,
      androidOriginatingUserId: fields[11] as int,
      androidProgressIndeterminate: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationPackageExtra obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.androidTitle)
      ..writeByte(1)
      ..write(obj.androidSubText)
      ..writeByte(2)
      ..write(obj.androidTemplate)
      ..writeByte(3)
      ..write(obj.androidShowChronometer)
      ..writeByte(4)
      ..write(obj.androidIcon)
      ..writeByte(5)
      ..write(obj.androidText)
      ..writeByte(6)
      ..write(obj.androidProgress)
      ..writeByte(7)
      ..write(obj.androidProgressMax)
      ..writeByte(8)
      ..write(obj.androidShowWhen)
      ..writeByte(9)
      ..write(obj.androidBigText)
      ..writeByte(10)
      ..write(obj.androidInfoText)
      ..writeByte(11)
      ..write(obj.androidOriginatingUserId)
      ..writeByte(12)
      ..write(obj.androidProgressIndeterminate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPackageExtraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
