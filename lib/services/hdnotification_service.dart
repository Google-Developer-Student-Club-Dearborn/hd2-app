import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:hd2_app/constants/hd_constants.dart';
import 'package:hd2_app/models/HDEvent.dart';
import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/event_details_page.dart';
import 'package:hd2_app/pages/notifications/notification_detail_page.dart';
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
            'HackDearborn 2',
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
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('app_icon');

    final iOSSettings = DarwinInitializationSettings(
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});
    final settings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    return settings;
  }

  static navigateToNotificationDetails(
      BuildContext? context, GlobalKey<NavigatorState>? navigatorKey, int? id) {
    final HDEventsService eventsService = HDEventsService();
    final eventReminders = eventsService.getEventReminders();
    final events = eventsService.getEvents();
    if (context != null && navigatorKey != null && id != null) {
      if (id >= HDConstants.eventReminderId) {
        navigatorKey.currentState?.pushNamed(
          HDConstants.notificationDetailPage,
          arguments: NotificationDetailPageArguments(
              selectedIndex: id, hdevents: eventReminders),
        );
      } else {
        navigatorKey.currentState?.pushNamed(
          HDConstants.eventDetailsPage,
          arguments:
              EventDetailPageArguments(selectedIndex: id, hdevents: events),
        );
      }
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

  void requestAndroidPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
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

  static Future<void> scheduleMultipleNotifications() async {
    final HDEventsService eventsService = HDEventsService();
    final List<HDEvent> eventsToSchedule = eventsService.getAllEvents();

    for (final event in eventsToSchedule) {
      await _scheduleNotification(event);
    }
  }

  static Future<void> _scheduleNotification(HDEvent event) async {
    final DateTime scheduledDate = event.from
        .subtract(const Duration(minutes: HDConstants.notificationOffset));

    await showScheduledNotification(
      id: event.index,
      title: event.eventName,
      body: event.description,
      scheduledDate: scheduledDate,
    );
  }

  static Future<void> showWelcomeNotification() async {
    final bool shouldShowNotification =
        await HDEventsService.shouldShowWelcomeNotification();

    if (shouldShowNotification) {
      Future.delayed(const Duration(minutes: 1), () async {
        await showNotification(
          id: 80,
          title: 'Welcome to HackDearborn 2!',
          body:
              '🚀 Get ready to challenge norms, push boundaries, and bring your wildest ideas to life. Happening on October 21!',
        );
      });
      await HDEventsService.markWelcomeNotificationAsShown();
    }
  }
}
