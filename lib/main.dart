import 'package:com.notification_watcher/model/notification_received_model.dart';
import 'package:com.notification_watcher/model/notification_event_model.dart';
import 'package:com.notification_watcher/services/hive_service.dart';
import 'package:com.notification_watcher/services/sharedpref_service.dart';
import 'package:com.notification_watcher/ui/incoming_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

final strgService = Get.find<StorageService>();
final hiveService = Get.find<HiveService>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final strgService = Get.put<StorageService>(StorageService());
  Get.put<HiveService>(HiveService());
  await strgService.initPrefs();
  // final appDocumentDir = await pathProvider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDir.path);
  await Hive.initFlutter();

  Hive.registerAdapter(NotificationPackageExtraAdapter());
  Hive.registerAdapter(NotificationEventAdapter());

  runApp(MyApp());
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
      home: IncomingNotifications(),
    );
  }
}
