import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:hd2_app/services/notification/Notification.dart';
import 'package:flutter/material.dart';
import 'package:hd2_app/shared/RouteArguments.dart';

import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'package:hd2_app/pages/agenda_page/getDataSource.dart';
import 'package:hd2_app/pages/agenda_page/event_details_page.dart';

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
    final events = getHDEvents();
    if (context != null && navigatorKey != null && id != null) {
      navigatorKey.currentState?.pushNamed(
        '/second_route',
        arguments: RouteArguments(selectedIndex: id, hdevents: events),
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
    List<HDNotificationObject> notifications = [
      HDNotificationObject(
          id: 1,
          title: 'Check-In Starts',
          body: 'Check in is at the UC entrance',
          scheduledDate: DateTime(2023, 08, 09, 22, 05)),
      HDNotificationObject(
          id: 2,
          title: 'Sponsor Fair/Check-In',
          body: 'Sponsors are coming in',
          scheduledDate: DateTime(2023, 08, 09, 22, 06)),
      HDNotificationObject(
          id: 3,
          title: 'Breakfast',
          body: 'Breakfast served now',
          scheduledDate: DateTime(2023, 08, 09, 22, 07)),
      HDNotificationObject(
          id: 4,
          title: 'Opening Ceremony',
          body: "Let's meet at the B Hall",
          scheduledDate: DateTime(2023, 08, 09, 22, 07)),
      HDNotificationObject(
          id: 5,
          title: 'Welcome to HackDearborn 2',
          body: 'Join us now',
          scheduledDate: DateTime.now().add(Duration(seconds: 15))),
      HDNotificationObject(
          id: 6,
          title: 'Disrupt Reality',
          body: 'Join us now',
          scheduledDate: DateTime.now().add(Duration(seconds: 30))),
      HDNotificationObject(
          id: 7,
          title: 'HackDearborn : Disrupt Reality',
          body: 'Stay tuned',
          scheduledDate: DateTime.now().add(Duration(seconds: 50))),
    ];

    for (int i = 0; i < notifications.length; i++) {
      final notification = notifications[i];
      await showScheduledNotification(
        id: notification.id,
        title: notification.title,
        body: notification.body,
        scheduledDate: notification.scheduledDate,
      );
    }
  }
}
