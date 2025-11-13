import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print('Handling a background message: ${message.messageId}');
    print('Background Data: ${message.data}');
  }
}

class FCMMethods {
  static final BehaviorSubject<RemoteMessage> messageStreamController =
      BehaviorSubject<RemoteMessage>();

  static Future<void> initFCM() async {
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('Notification permission granted.');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      if (kDebugMode) {
        print('Notification permission denied.');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.notDetermined) {
      if (kDebugMode) {
        print('Notification permission not determined.');
      }
    }
    messaging.getToken().then((value) => debugPrint('FCM Token: $value'));

    messaging.onTokenRefresh.listen((fcmToken) {
      if (kDebugMode) {
        debugPrint('Token refreshed: $fcmToken');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      if (kDebugMode) {
        print('Handling a foreground message: ${msg.messageId}');
        print('Message notification: ${msg.notification?.title}');
        print('Message notification: ${msg.notification?.body}');
      }
      messageStreamController.sink.add(msg);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static void dispose() {
    messageStreamController.close();
  }
}
