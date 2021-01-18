import 'package:app_settings/app_settings.dart';
// import 'package:background_fetch/background_fetch.dart';
import 'package:com.notification_watcher/controllers/ntf_listener_controller.dart';
import 'package:com.notification_watcher/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class IncomingNotifications extends StatefulWidget {
  @override
  _IncomingNotificationsState createState() => _IncomingNotificationsState();
}

class _IncomingNotificationsState extends State<IncomingNotifications> {
  @override
  void initState() {
    super.initState();
    // initPlatformState();
    workmngService.initOneSignal();
  }

  @override
  Widget build(BuildContext context) {
    // var ntfCtrl = Get.put<NotificationListenerController>(
    //     NotificationListenerController());

    // Get.find<StorageService>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Incoming Notificaions"),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_outlined),
            onPressed: () async {
              await Hive.deleteBoxFromDisk("receivedList");
              ntfCtrl.ntfEventsList.clear();
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              await AppSettings.openNotificationSettings();
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ntfCtrl.ntfEventsList[index].packageText ?? ''),
                  Text(ntfCtrl.ntfEventsList[index].packageMessage ?? ''),
                ],
              ),
              subtitle: Text(
                ntfCtrl.ntfEventsList[index].packageName ?? '',
              ),
            );
          },
          itemCount: ntfCtrl.ntfEventsList.length,
        ),
      ),
    );
  }

  // Future<void> initPlatformState() async {
  //   // Configure BackgroundFetch.
  //   BackgroundFetch.configure(
  //       BackgroundFetchConfig(
  //           minimumFetchInterval: 15,
  //           stopOnTerminate: false,
  //           startOnBoot: true,
  //           enableHeadless: true,
  //           requiresBatteryNotLow: false,
  //           requiresCharging: false,
  //           requiresStorageNotLow: false,
  //           requiresDeviceIdle: false,
  //           requiredNetworkType: NetworkType.NONE), (String taskId) async {
  //     // This is the fetch-event callback.
  //     print("[BackgroundFetch] Event received $taskId");
  //     // IMPORTANT:  You must signal completion of your task or the OS can punish your app
  //     // for taking too long in the background.
  //     BackgroundFetch.finish(taskId);
  //   }).then((int status) {
  //     print('[BackgroundFetch] configure success: $status');
  //   }).catchError((e) {
  //     print('[BackgroundFetch] configure ERROR: $e');
  //   });

  //   // Optionally query the current BackgroundFetch status.
  //   int status = await BackgroundFetch.status;

  //   if (!mounted) return;
  // }
}
