import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

List<Meeting> getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 10);
  final DateTime endTime = startTime.add(const Duration(hours: 1));

  const year = 2023;
  const month = 10;
  const day1 = 21;
  const day2 = 22;

  const String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

  // Check-in
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
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
  meetings.add(
    Meeting(
      'Closing Ceremony',
      DateTime(year, month, day2, 15),
      DateTime(year, month, day2, 15, 45),
      const Color.fromARGB(255, 188, 23, 141),
      false,
      "McKinley Café",
      21,
    ),
  );

  return meetings;
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.description, this.index);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  int index;
  String description;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
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
