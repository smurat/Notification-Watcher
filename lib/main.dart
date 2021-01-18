// import 'package:background_fetch/background_fetch.dart';
import 'package:com.notification_watcher/app_retain_widget.dart';
import 'package:com.notification_watcher/model/notification_received_model.dart';
import 'package:com.notification_watcher/model/notification_event_model.dart';
import 'package:com.notification_watcher/services/hive_service.dart';
import 'package:com.notification_watcher/services/sharedpref_service.dart';
import 'package:com.notification_watcher/services/work_manager_service.dart';
import 'package:com.notification_watcher/ui/incoming_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:com.notification_watcher/controllers/ntf_listener_controller.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:com.notification_watcher/background_main.dart';

final strgService = Get.find<StorageService>();
final hiveService = Get.find<HiveService>();
final workmngService = Get.find<WorkManagerService>();
final ntfCtrl = Get.find<NotificationListenerController>();

void backgroundFetchHeadlessTask(String taskId) async {
  print('[BackgroundFetch] Headless event received.');
  // ntfCtrl.startListening();
  print('Arkaplanda.');
  // BackgroundFetch.finish(taskId);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final strgService = Get.put<StorageService>(StorageService());
  await strgService.initPrefs();
  Get.put<HiveService>(HiveService());
  await Hive.initFlutter();
  Hive.registerAdapter(NotificationPackageExtraAdapter());
  Hive.registerAdapter(NotificationEventAdapter());
  Get.put<NotificationListenerController>(NotificationListenerController());
  Get.put<WorkManagerService>(WorkManagerService());

  runApp(MyApp());

  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  var channel = const MethodChannel('com.example/background_service');
  var callbackHandle = PluginUtilities.getCallbackHandle(backgroundMain);
  channel.invokeMethod('startService', callbackHandle.toRawHandle());
  ntfCtrl.startListening();
}

Future<void> initServices() async {
  print('starting services ...');

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync(() => StorageService().initPrefs());
  print('All services started...');
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppRetainWidget(
        child: IncomingNotifications(),
      ),
    );
  }
}
