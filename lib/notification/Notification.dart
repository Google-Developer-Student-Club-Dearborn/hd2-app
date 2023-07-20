import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

class HD2Notification {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channel name'),
        iOS: DarwinNotificationDetails());
  }

  static Future init({bool initScheduled = false}) async {
    final androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOSSettings = DarwinInitializationSettings();
    final settings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    await _notifications.initialize(settings);
  }

  static Future showNotification(
          {int id = 0, String? title, String? body}) async =>
      _notifications.show(id, title, body, await _notificationDetails());
}
