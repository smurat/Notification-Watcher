import 'package:flutter/material.dart';
import 'package:com.notification_watcher/model/notification_received_model.dart';
import 'package:com.notification_watcher/model/notification_event_model.dart';
import 'package:com.notification_watcher/services/hive_service.dart';
import 'package:com.notification_watcher/services/sharedpref_service.dart';
import 'package:com.notification_watcher/services/work_manager_service.dart';
import 'package:com.notification_watcher/main.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:com.notification_watcher/controllers/ntf_listener_controller.dart';

void backgroundMain() async {
  WidgetsFlutterBinding.ensureInitialized();

  final strgService = Get.put<StorageService>(StorageService());
  await strgService.initPrefs();
  Get.put<HiveService>(HiveService());
  await Hive.initFlutter();
  Hive.registerAdapter(NotificationPackageExtraAdapter());
  Hive.registerAdapter(NotificationEventAdapter());
  Get.put<NotificationListenerController>(NotificationListenerController());
  Get.put<WorkManagerService>(WorkManagerService());
  ntfCtrl.startListening();
}
