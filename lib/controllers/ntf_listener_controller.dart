import 'dart:async';
import 'dart:convert';

import 'package:android_notification_listener2/android_notification_listener2.dart';
import 'package:com.notification_watcher/main.dart';
import 'package:com.notification_watcher/model/notification_received_model.dart';
import 'package:com.notification_watcher/model/notification_event_model.dart';
import 'package:com.notification_watcher/services/sharedpref_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class NotificationListenerController extends GetxController {
  StreamSubscription<NotificationEventV2> _subscription;
  var ntfReceivedList = List<NotificationPackageExtra>().obs;
  List<NotificationEventModel> ntfEventsList = List();
  AndroidNotificationListener _notifications;
  final List<String> ntfTitles =
      (Get.find<StorageService>()?.getStringList("titles") ?? ['']).obs;

  Future<void> initPlatformState() async {
    startListening();
  }

  void onData(NotificationEventV2 event) async {
    // print(event);
    final eventData = json.encode(event);
    final ntfEventData = notificationEventFromJson(eventData);
    ntfEventsList.add(ntfEventData);
    print(ntfEventsList[0].timeStamp);
    print(ntfEventsList[0].packageExtra.androidBigText);
    print('converting package extra to json');
    print(ntfEventsList[0].timeStamp);
    var jsonDatax = json.decode(event.packageExtra);
    var ntfData = NotificationPackageExtra.fromJson(jsonDatax);
    var isBoxOpen = Hive.isBoxOpen("receivedList");
    var hiveBox = Hive.box("receivedList");
    print("Box açık : $isBoxOpen");
    if (ntfData.androidTitle != null) {
      ntfReceivedList.add(ntfData);
      hiveBox.add(ntfData);
      // hiveService.addBoxes(ntfReceivedList, "receivedList");

    }
  }

  void startListening() {
    _notifications = new AndroidNotificationListener();
    try {
      _subscription = _notifications.notificationStream.listen(onData);
    } on NotificationExceptionV2 catch (exception) {
      print(exception);
    }
  }

  void stopListening() {
    _subscription.cancel();
  }

  @override
  void onInit() async {
    startListening();
    var openedBox =
        await hiveService.getBoxes<NotificationPackageExtra>("receivedList");
    print("Hive Ntf list:  ${openedBox.length}");
    ntfReceivedList.assignAll(
        await hiveService.getBoxes<NotificationPackageExtra>("receivedList"));
    super.onInit();
  }
}
