import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import '../utils/services//local_notification_service.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:thingsboard_app/utils/services/global.dart' as globals;

Future<String> getCheckNotificationPermStatus() {
  return NotificationPermissions.getNotificationPermissionStatus()
      .then((status) {
    print(status);
    switch (status) {
      case PermissionStatus.denied:
        return 'permDenied';
      case PermissionStatus.granted:
        return 'permGranted';
      case PermissionStatus.unknown:
        return 'permUnknown';
      case PermissionStatus.provisional:
        return 'permProvisional';
      default:
        return '';
    }
  });
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body ${message.notification?.body}');
  print('Payload ${message.data}');
  // ignore: unnecessary_null_comparison
  if (message == null) return;
  var datas = message.data.toString();
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    getCheckNotificationPermStatus();
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${_firebaseMessaging}');
    print('object---------------');
    if (Platform.isAndroid) {
      final fcmToken = await _firebaseMessaging.getToken();

      print('Token $fcmToken');
      if (fcmToken != '') {
        //initNotification();
        globals.pushToken = fcmToken!;
        FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
      }
    } else {
      final apnsToken = await _firebaseMessaging.getAPNSToken();

      print('Token $apnsToken');
      if (apnsToken != '') {
        //initNotification();
        final fcmToken =
            await FirebaseMessaging.instance.getToken(vapidKey: 'V4YKU6Y585');

        print('FCM Token: $fcmToken');

        globals.pushToken = fcmToken!;
        FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
      }
    }

    FirebaseMessaging.onMessage.listen(
      (message) {
        print('gfghb');
        print("FirebaseMessaging.onMessage.listen back ground");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data}");
          // navigatorKey.currentState?.pushNamed('/swiper');
          print('object00000000-------------9');
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
  }
}
