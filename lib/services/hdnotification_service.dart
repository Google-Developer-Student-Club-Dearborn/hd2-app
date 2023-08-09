import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:hd2_app/models/HDEvent.dart';
import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/event_details_page.dart';
import 'package:hd2_app/services/hdevent_service.dart';

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

  static Future init(
      {bool initScheduled = false,
      BuildContext? context,
      GlobalKey<NavigatorState>? navigatorKey}) async {
    final settings = getInitializationSettings();
    await _notifications.initialize(settings, onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {
      navigateToNotificationDetails(
          context, navigatorKey, notificationResponse.id);
    });

    if (initScheduled) {
      // Get the device's timezone using FlutterNativeTimezone
      String timeZoneName;
      try {
        timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
      } catch (e) {
        // Fallback to UTC if there's an error
        timeZoneName = 'UTC';
      }

      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
      HDNotificationService.scheduleMultipleNotifications();
    }
  }

  static InitializationSettings getInitializationSettings() {
    // TODO find android app icon
    final AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final iOSSettings = DarwinInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});
    final settings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    return settings;
  }

  static navigateToNotificationDetails(
      BuildContext? context, GlobalKey<NavigatorState>? navigatorKey, int? id) {
    final events = HDEventsService();
    if (context != null && navigatorKey != null && id != null) {
      navigatorKey.currentState?.pushNamed(
        '/event_details',
        arguments:
            EventDetailPageArguments(selectedIndex: id, hdevents: events),
      );
    }
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
    List<HDEvent> hdevents = HDEventsService();
    hdevents.add(
      HDEvent(
        'Welcome to Hack Dearborn 2',
        DateTime.now().add(Duration(minutes: 10, seconds: 15)),
        DateTime.now().add(Duration(seconds: 60)),
        Colors.blue,
        false,
        'Stay tuned',
        50,
      ),
    );
    hdevents.add(
      HDEvent(
        'HackDearborn : Disrupt Reality',
        DateTime.now().add(Duration(minutes: 10, seconds: 45)),
        DateTime.now().add(Duration(seconds: 60)),
        Colors.blue,
        false,
        'Join us now',
        60,
      ),
    );
    for (int i = 0; i < hdevents.length; i++) {
      final hdevent = hdevents[i];
      await showScheduledNotification(
          id: hdevent.index,
          title: hdevent.eventName,
          body: hdevent.description,
          scheduledDate: hdevent.from.subtract(Duration(minutes: 10)));
    }
  }
}
