import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HDNotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static final onNotifications = BehaviorSubject<String?>();

  static const NotificationDetails platformChannelSpecifics =
      NotificationDetails(
          android: AndroidNotificationDetails(
            'channel id',
            'channel name',
            playSound: true,
            priority: Priority.high,
            importance: Importance.high,
          ),
          iOS: DarwinNotificationDetails(
              presentAlert: true, presentBadge: true, presentSound: true));

  static Future init({bool initScheduled = false}) async {
    final settings = getInitializationSettings();
    await _notifications.initialize(settings);

    if (initScheduled) {
      // Get the device's timezone using FlutterNativeTimezone
      String timeZoneName;
      try {
        timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
      } catch (e) {
        // Handle any potential errors when getting the timezone
        timeZoneName = 'UTC'; // Fallback to UTC if there's an error
      }

      // Initialize the timezone for the tz library
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
      HDNotificationService.scheduleMultipleNotifications();
    }
  }

  static InitializationSettings getInitializationSettings() {
    // TODO find android app icon
    final AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final iOSSettings = DarwinInitializationSettings();
    final settings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    return settings;
  }

  void requestIOSPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future showNotification(
          {int id = 0, String? title, String? body}) async =>
      _notifications.show(id, title, body, platformChannelSpecifics);

  static Future showScheduledNotification(
          {int id = 0,
          String? title,
          String? body,
          required DateTime scheduledDate}) async =>
      {
        _notifications.zonedSchedule(
            id,
            title,
            body,
            tz.TZDateTime.from(scheduledDate, tz.local),
            platformChannelSpecifics,
            androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime)
      };

  static Future scheduleMultipleNotifications() async {
    final int numNotifications = 5;

    final int interval = 15;

    for (int i = 0; i < numNotifications; i++) {
      await showScheduledNotification(
        title: 'Test notifications',
        body: "This is what it's going to look like",
        scheduledDate: DateTime.now().add(Duration(seconds: i * interval)),
        id: i,
      );
    }
  }
}
