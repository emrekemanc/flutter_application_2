import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/data/services/notification_service.dart';
import 'package:rxdart/rxdart.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize Firebase for background execution
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

    // CRITICAL FIX: Listener is NOT async and does not use await internally.
    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      if (kDebugMode) {
        print('Handling a foreground message: ${msg.messageId}');
      }

      final notification = msg.notification;
      final data = msg.data;

      if (notification != null) {
        // Show local notification using data from FCM. (Fire-and-forget)
        NotificationService().showInstantNotification(
          id: notification.hashCode,
          title: notification.title ?? 'New Notification',
          body: notification.body ?? 'Check your app for details.',
          // Payload güvenli bir şekilde String'e dönüştürülür (Crash önlenir)
          payload: data['payload']?.toString() ?? data.toString(),
        );
      }
      messageStreamController.sink.add(msg);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static void dispose() {
    messageStreamController.close();
  }
}
