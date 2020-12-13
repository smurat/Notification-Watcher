import 'dart:convert';
import 'package:hive/hive.dart';
part 'notification_received_model.g.dart';

NotificationPackageExtra notificationPackageExtraFromJson(String str) =>
    NotificationPackageExtra.fromJson(json.decode(str));

String notificationPackageExtraToJson(NotificationPackageExtra data) =>
    json.encode(data.toJson());



@HiveType(typeId: 0)
class NotificationPackageExtra {
  @HiveField(0)
  String androidTitle;
  @HiveField(1)
  dynamic androidSubText;
  @HiveField(2)
  String androidTemplate;
  @HiveField(3)
  bool androidShowChronometer;
  @HiveField(4)
  int androidIcon;
  @HiveField(5)
  String androidText;
  @HiveField(6)
  int androidProgress;
  @HiveField(7)
  int androidProgressMax;
  @HiveField(8)
  bool androidShowWhen;
  @HiveField(9)
  String androidBigText;
  @HiveField(10)
  dynamic androidInfoText;
  @HiveField(11)
  int androidOriginatingUserId;
  @HiveField(12)
  bool androidProgressIndeterminate;

  NotificationPackageExtra({
    this.androidTitle,
    this.androidSubText,
    this.androidTemplate,
    this.androidShowChronometer,
    this.androidIcon,
    this.androidText,
    this.androidProgress,
    this.androidProgressMax,
    this.androidShowWhen,
    this.androidBigText,
    this.androidInfoText,
    this.androidOriginatingUserId,
    this.androidProgressIndeterminate,
  });

  factory NotificationPackageExtra.fromJson(Map<String, dynamic> json) =>
      NotificationPackageExtra(
        androidTitle: json["android.title"],
        androidSubText: json["android.subText"],
        androidTemplate: json["android.template"],
        androidShowChronometer: json["android.showChronometer"],
        androidIcon: json["android.icon"],
        androidText: json["android.text"],
        androidProgress: json["android.progress"],
        androidProgressMax: json["android.progressMax"],
        androidShowWhen: json["android.showWhen"],
        androidBigText: json["android.bigText"],
        androidInfoText: json["android.infoText"],
        androidOriginatingUserId: json["android.originatingUserId"],
        androidProgressIndeterminate: json["android.progressIndeterminate"],
      );

  Map<String, dynamic> toJson() => {
        "android.title": androidTitle,
        "android.subText": androidSubText,
        "android.template": androidTemplate,
        "android.showChronometer": androidShowChronometer,
        "android.icon": androidIcon,
        "android.text": androidText,
        "android.progress": androidProgress,
        "android.progressMax": androidProgressMax,
        "android.showWhen": androidShowWhen,
        "android.bigText": androidBigText,
        "android.infoText": androidInfoText,
        "android.originatingUserId": androidOriginatingUserId,
        "android.progressIndeterminate": androidProgressIndeterminate,
      };
}
