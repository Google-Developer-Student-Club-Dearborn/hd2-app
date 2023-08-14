import 'dart:math';

import 'package:hd2_app/constants/hd_constants.dart';
import 'package:hd2_app/models/HDEvent.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class HDEventsService {
  List<HDEvent> getEvents() {
    final List<HDEvent> hdevents = <HDEvent>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 10);
    final DateTime endTime = startTime.add(const Duration(hours: 1));

    const year = HDConstants.YEAR;
    const month = HDConstants.MONTH;
    const day1 = HDConstants.DAY_1;
    const day2 = HDConstants.DAY_2;

    const String loremIpsum =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

    // Check-in
    hdevents.add(
      HDEvent(
        'Check-in Starts',
        DateTime(year, month, day1, 10),
        DateTime(year, month, day1, 10),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Check in at UC front desk. \nProfessional headshots in Kochoff Hall A.",
        0,
      ),
    );

    // Sponsor-Fair
    hdevents.add(
      HDEvent(
        'Sponsor Fair/Check In',
        DateTime(year, month, day1, 10),
        DateTime(year, month, day1, 11, 15),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Sponsor Fair!",
        1,
      ),
    );

    // Opening Ceremony
    hdevents.add(
      HDEvent(
        'Opening Ceremony',
        DateTime(year, month, day1, 11, 15),
        DateTime(year, month, day1, 12),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Location: Kochoff Hall B & C",
        2,
      ),
    );

    // Hacking Starts
    hdevents.add(
      HDEvent(
        'Hacking Starts',
        DateTime(year, month, day1, 12),
        DateTime(year, month, day1, 12),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Hacking Starts!",
        3,
      ),
    );

    // Lunch & team formation
    hdevents.add(
      HDEvent(
        'Lunch/Team Formation',
        DateTime(year, month, day1, 12),
        DateTime(year, month, day1, 13),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "Lunch at McKinley Café",
        4,
      ),
    );

    // Technical Mentor Tables
    hdevents.add(
      HDEvent(
        'Technical Mentor Tables',
        DateTime(year, month, day1, 13),
        DateTime(year, month, day1, 14),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "UC Dining Hallr",
        5,
      ),
    );

    // Workshops
    hdevents.add(
      HDEvent(
        'Workshops',
        DateTime(year, month, day1, 14),
        DateTime(year, month, day1, 15),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "UC 1225 & 1227",
        6,
      ),
    );

    // Workshops
    hdevents.add(
      HDEvent(
        'Workshops',
        DateTime(year, month, day1, 16),
        DateTime(year, month, day1, 17),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "UC 1225 & 1227",
        7,
      ),
    );

    // Games and Activities
    hdevents.add(
      HDEvent(
        'Fun Activity',
        DateTime(year, month, day1, 17),
        DateTime(year, month, day1, 18),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "TBD. Location UC Stage.",
        8,
      ),
    );

    // Dinner
    hdevents.add(
      HDEvent(
        'Dinner',
        DateTime(year, month, day1, 19),
        DateTime(year, month, day1, 20),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        loremIpsum,
        9,
      ),
    );

    // MLH Challenge
    hdevents.add(
      HDEvent(
        'MLH Challenge',
        DateTime(year, month, day1, 20),
        DateTime(year, month, day1, 21),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        "UC 1225",
        10,
      ),
    );

    // Entry Closed
    hdevents.add(
      HDEvent(
        'Entry Closed Until 7am',
        DateTime(year, month, day1, 23),
        DateTime(year, month, day1, 23),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        loremIpsum,
        11,
      ),
    );

    // Day 2

    // Midnight Snack + Game
    hdevents.add(
      HDEvent(
        'Midnight Snack + Game',
        DateTime(year, month, day2),
        DateTime(year, month, day2),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "McKinley Café",
        12,
      ),
    );

    // Doors Reopen
    hdevents.add(
      HDEvent(
        'Doors Reopen',
        DateTime(year, month, day2, 7),
        DateTime(year, month, day2, 7),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        loremIpsum,
        13,
      ),
    );

    // Breakfast
    hdevents.add(
      HDEvent(
        'Breakfast',
        DateTime(year, month, day2, 8),
        DateTime(year, month, day2, 9),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "McKinley Café",
        14,
      ),
    );

    // Demoing for Dummies
    hdevents.add(
      HDEvent(
        'Demoing for Dummies',
        DateTime(year, month, day2, 9, 30),
        DateTime(year, month, day2, 10, 30),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "UC 1225",
        15,
      ),
    );

    // Hacking Ends
    hdevents.add(
      HDEvent(
        'Hacking Ends!',
        DateTime(year, month, day2, 12),
        DateTime(year, month, day2, 12),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        loremIpsum,
        16,
      ),
    );

    // Lunch
    hdevents.add(
      HDEvent(
        'Lunch',
        DateTime(year, month, day2, 12),
        DateTime(year, month, day2, 13),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "McKinley Café",
        17,
      ),
    );

    // Hacker Set Up
    hdevents.add(
      HDEvent(
        'Hacker Set Up',
        DateTime(year, month, day2, 13),
        DateTime(year, month, day2, 13, 30),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "UC Entrace Hallway",
        18,
      ),
    );

    // Judging
    hdevents.add(
      HDEvent(
        'Judging',
        DateTime(year, month, day2, 13, 30),
        DateTime(year, month, day2, 14, 30),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "UC Entrace Hallway",
        19,
      ),
    );

    // Game
    hdevents.add(
      HDEvent(
        'Game',
        DateTime(year, month, day2, 14, 30),
        DateTime(year, month, day2, 15),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "TBD: MLH",
        20,
      ),
    );

    // Closing Ceremony
    hdevents.add(
      HDEvent(
        'Closing Ceremony',
        DateTime(year, month, day2, 15),
        DateTime(year, month, day2, 15, 45),
        const Color.fromARGB(255, 188, 23, 141),
        false,
        "McKinley Café",
        21,
      ),
    );

    return hdevents;
  }

  List<HDEvent> getEventReminders() {
    final List<HDEvent> hdevents = <HDEvent>[];

    hdevents.add(
      HDEvent(
        'Welcome to HackDearborn 2!',
        DateTime.now().add(Duration(minutes: 10, seconds: 50)),
        DateTime.now().add(Duration(seconds: 60)),
        Colors.blue,
        false,
        "🚀 Get ready to challenge norms, push boundaries, and bring your wildest ideas to life. Happening on October 21!",
        80,
      ),
    );

    hdevents.add(
      HDEvent(
        'Get Ready to Disrupt Reality!',
        DateTime(
            HDConstants.YEAR, HDConstants.MONTH - 1, HDConstants.DAY_1, 20),
        DateTime(HDConstants.YEAR, HDConstants.MONTH - 1, HDConstants.DAY_1),
        Colors.blue,
        false,
        'Stay tuned for more updates and prepare for an unforgettable hackathon experience! Happening on October 21.',
        81,
      ),
    );

    hdevents.add(
      HDEvent(
        'HackDearborn 2 is Just Around the Corner!',
        DateTime(HDConstants.YEAR, HDConstants.MONTH, 7, 12),
        DateTime(HDConstants.YEAR, HDConstants.MONTH, HDConstants.DAY_1),
        Colors.blue,
        false,
        "Only 2 weeks left until HackDearborn 2! Are you ready to disrupt reality? Sharpen your skills, gather your team, and prepare for an exhilarating hackathon adventure. ",
        82,
      ),
    );

    hdevents.add(
      HDEvent(
        'One Week to Go! Are You Prepared?',
        DateTime(HDConstants.YEAR, HDConstants.MONTH, 14, 12),
        DateTime(HDConstants.YEAR, HDConstants.MONTH, HDConstants.DAY_1),
        Colors.blue,
        false,
        'The countdown is on! In just one week, HackDearborn 2 will unleash a wave of innovation. Fine-tune your ideas and get ready to challenge the boundaries of reality!',
        83,
      ),
    );

    hdevents.add(
      HDEvent(
        'Just 2 Days Left! Get Set for HackDearborn 2!',
        DateTime(
            HDConstants.YEAR, HDConstants.MONTH, HDConstants.DAY_1 - 2, 19),
        DateTime(HDConstants.YEAR, HDConstants.MONTH, HDConstants.DAY_1),
        Colors.blue,
        false,
        'The excitement is palpable! With only 2 days remaining, HackDearborn 2 is about to redefine reality. Double-check your arrangements and get ready to turn your visions into reality!',
        84,
      ),
    );

    hdevents.add(
      HDEvent(
        'It\'s Showtime Tomorrow! Rest Up for HackDearborn 2!',
        DateTime(
            HDConstants.YEAR, HDConstants.MONTH, HDConstants.DAY_1 - 1, 20),
        DateTime(HDConstants.YEAR, HDConstants.MONTH, HDConstants.DAY_1),
        Colors.purple,
        false,
        'The night before HackDearborn 2 is here! Take a deep breath, relax, and recharge your energy. An incredible hackathon journey awaits you. See you all tomorrow!',
        85,
      ),
    );

    hdevents.add(
      HDEvent(
        'Good morning hackers!',
        DateTime(HDConstants.YEAR, HDConstants.MONTH, HDConstants.DAY_1, 6),
        DateTime(HDConstants.YEAR, HDConstants.MONTH, HDConstants.DAY_1),
        Colors.purple,
        false,
        'HackDearborn 2 is happening today. Get ready to Disrupt Reality!',
        86,
      ),
    );
    return hdevents;
  }

  List<HDEvent> getAllEvents() {
    final List<HDEvent> events = getEvents();
    final List<HDEvent> eventReminders = getEventReminders();
    final List<HDEvent> allEvents = [...events, ...eventReminders];
    return allEvents;
  }

/* 
  the notifications are fired 10 mins before the scheduled start time of the event
  so get the events even before their scheduled time if the notification time (10 minutes before the event) has already passed 
*/
  List<HDEvent> getFilteredEvents() {
    final DateTime currentDate = DateTime.now();
    final List<HDEvent> events = getAllEvents();
    final List<HDEvent> filteredEvents = events.where((event) {
      DateTime notificationTime = event.from
          .subtract(Duration(minutes: HDConstants.NOTIFICATION_OFFSET));
      return notificationTime.isBefore(currentDate) ||
          event.from.isBefore(currentDate) ||
          event.from.isAtSameMomentAs(currentDate);
    }).toList();

    return filteredEvents.reversed.toList();
  }
}

class HDEventsSource extends CalendarDataSource {
  HDEventsSource(List<HDEvent> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
