import 'dart:convert';
import 'package:hive/hive.dart';
import 'notification_received_model.dart';
part 'notification_event_model.g.dart';

NotificationEventModel notificationEventFromJson(String str) =>
    NotificationEventModel.fromJson(json.decode(str));

String notificationEventToJson(NotificationEventModel data) =>
    json.encode(data.toJson());

@HiveType(typeId: 1)
class NotificationEventModel {
  @HiveField(0)
  String packageName;
  @HiveField(1)
  String packageText;
  @HiveField(2)
  String packageMessage;
  @HiveField(3)
  DateTime timeStamp;
  @HiveField(4)
  NotificationPackageExtra packageExtra;

  NotificationEventModel({
    this.packageName,
    this.packageText,
    this.packageMessage,
    this.timeStamp,
    this.packageExtra,
  });

  NotificationEventModel notificationPackageExtraFromJson(String str) =>
      NotificationEventModel.fromJson(json.decode(str));

  factory NotificationEventModel.fromJson(Map<String, dynamic> json) =>
      NotificationEventModel(
        timeStamp: DateTime.now(),
        packageName: json['packageName'],
        packageExtra: NotificationPackageExtra.fromJson(json["packageExtra"]),
        packageMessage: json['packageMessage'],
        packageText: json['packageText'],
      );

  Map<String, dynamic> toJson() => {
        "timeStamp": timeStamp.toIso8601String(),
        "packageName": packageName,
        "packageExtra": packageExtra.toJson(),
        "packageMessage": packageMessage,
        "packageText": packageText,
      };
}
