import 'package:com.notification_watcher/controllers/ntf_listener_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class IncomingNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ntfCtrl = Get.put<NotificationListenerController>(
        NotificationListenerController());

    // Get.find<StorageService>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Incoming Notificaions"),
        actions: [
          IconButton(
            icon: Icon(Icons.clear_outlined),
            onPressed: () async {
              await Hive.deleteBoxFromDisk("receivedList");
              ntfCtrl.ntfReceivedList.clear();
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(ntfCtrl.ntfReceivedList[index].androidTitle ?? ''),
              subtitle: Text(
                ntfCtrl.ntfReceivedList[index]?.androidBigText ?? '',
              ),
            );
          },
          itemCount: ntfCtrl.ntfReceivedList.length,
        ),
      ),
    );
  }
}
