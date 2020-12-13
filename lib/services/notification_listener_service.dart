// import 'dart:async';
// import 'dart:convert';
// import 'package:android_notification_listener2/android_notification_listener2.dart';
// import 'package:com.notification_watcher/model/notification_received_model.dart';

// class NotificationListenerService {
//   AndroidNotificationListener _notifications;
//   StreamSubscription<NotificationEventV2> _subscription;

//   Future<void> initPlatformState() async {
//     startListening();
//   }

//   void onData(NotificationEventV2 event) {
//     print(event);
//     print('converting package extra to json');
//     var jsonDatax = json.decode(event.packageExtra);
//     print(event.packageExtra);
//   }

//   StreamSubscription<NotificationEventV2> startListening() {
//     _notifications = new AndroidNotificationListener();
//     try {
//       _subscription = _notifications.notificationStream.listen(onData);
//       return _subscription;
//     } on NotificationExceptionV2 catch (exception) {
//       print(exception);
//       return _subscription;
//     }
//   }

//   void stopListening() {
//     _subscription.cancel();
//   }
// }
