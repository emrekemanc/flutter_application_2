import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  // Singleton Pattern
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationDetails _defaultAndroidDetails =
      const AndroidNotificationDetails(
        'high_importance_channel',
        'General Notifications',
        channelDescription: 'General purpose notification channel for the app.',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'New Information',
      );

  // Payload handler (Only logs for safety, UI logic should be handled elsewhere)
  static void _handleNotificationPayload(String? payload) {
    if (payload != null) {
      debugPrint('Notification Payload: $payload');
      // Uygulama açıkken veya kapalıyken bildirim tıklandığında yapılacak işlemlerin mantığı buraya gelir.
      // Kritik: UI veya Context gerektiren kod buraya yazılmamalıdır.
    }
  }

  @pragma('vm:entry-point')
  static void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    _handleNotificationPayload(notificationResponse.payload);
  }

  @pragma('vm:entry-point')
  static void onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    _handleNotificationPayload(notificationResponse.payload);
  }

  Future<void> initialize() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('android_icon_not');
    const DarwinInitializationSettings darwinSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidSettings,
          iOS: darwinSettings,
          macOS: darwinSettings,
        );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  Future<NotificationAppLaunchDetails?> getLaunchDetails() async {
    return flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  }

  Future<void> showInstantNotification({
    required int id,
    required String? title,
    required String? body,
    String? payload,
  }) async {
    final NotificationDetails notificationDetails = NotificationDetails(
      android: _defaultAndroidDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime scheduledDate,
    String? payload,
  }) async {
    final NotificationDetails notificationDetails = NotificationDetails(
      android: _defaultAndroidDetails,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  Future<void> scheduleRepeatingNotification({
    required int id,
    required String title,
    required String body,
    required RepeatInterval interval,
    String? payload,
  }) async {
    final NotificationDetails notificationDetails = NotificationDetails(
      android: _defaultAndroidDetails,
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      interval,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  Future<void> cancel(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }
}
