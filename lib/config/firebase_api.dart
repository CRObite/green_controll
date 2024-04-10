import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:green_control/domain/device_id.dart';

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications()async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();

    print('Token: $fcmToken');
    DeviceData.device_id = fcmToken;

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Title: ${message.notification?.body}');
  print('Title: ${message.data}');
}