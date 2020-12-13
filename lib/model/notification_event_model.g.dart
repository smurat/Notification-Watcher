// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationEventAdapter extends TypeAdapter<NotificationEventModel> {
  @override
  final int typeId = 1;

  @override
  NotificationEventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationEventModel(
      packageName: fields[0] as String,
      packageText: fields[1] as String,
      packageMessage: fields[2] as String,
      timeStamp: fields[3] as DateTime,
      packageExtra: fields[4] as NotificationPackageExtra,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationEventModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.packageName)
      ..writeByte(1)
      ..write(obj.packageText)
      ..writeByte(2)
      ..write(obj.packageMessage)
      ..writeByte(3)
      ..write(obj.timeStamp)
      ..writeByte(4)
      ..write(obj.packageExtra);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
