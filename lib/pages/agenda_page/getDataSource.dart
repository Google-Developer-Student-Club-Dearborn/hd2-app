import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

List<Meeting> getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime theDay = DateTime(2023, 10, 21);
  final DateTime startTime =
      DateTime(theDay.year, theDay.month, theDay.day, 10);
  final DateTime endTime = startTime.add(const Duration(hours: 1));

  const String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

  DatabaseReference ref = FirebaseDatabase.instance.ref();
  ref.child('agenda/1').get().then((value) {
    if (value.exists) {
      print(value.value);
    } else {
      print('No data available.');
    }
  });

  print("hello world!");

  // Check-in
  // meetings.add(
  //   Meeting(
  //     'Check-in',
  //     startTime,
  //     startTime,
  //     const Color(0xFF0F8644),
  //     false,
  //     loremIpsum,
  //     0,
  //   ),
  // );

  // Sponsor-Fair
  meetings.add(
    Meeting(
      'Sponsor Fair',
      DateTime(theDay.year, theDay.month, theDay.day, 10),
      DateTime(theDay.year, theDay.month, theDay.day, 11, 15),
      Color.fromARGB(255, 73, 23, 188),
      false,
      loremIpsum,
      1,
    ),
  );

  // Opening Ceremony
  meetings.add(
    Meeting(
      'Opening Ceremony',
      DateTime(theDay.year, theDay.month, theDay.day, 11, 15),
      endTime.add(const Duration(hours: 1)),
      Color.fromARGB(255, 73, 23, 188),
      false,
      loremIpsum,
      2,
    ),
  );

  // Lunch
  meetings.add(
    Meeting(
      'Lunch/Team Formation',
      DateTime(theDay.year, theDay.month, theDay.day, 12),
      DateTime(theDay.year, theDay.month, theDay.day, 13),
      Color.fromARGB(255, 73, 23, 188),
      false,
      loremIpsum,
      3,
    ),
  );

  // ML With Google Cloud Workshop
  meetings.add(
    Meeting(
      'ML With Google Cloud /Make Your Own Chatbot Workshop',
      DateTime(theDay.year, theDay.month, theDay.day, 14),
      DateTime(theDay.year, theDay.month, theDay.day, 15),
      Color.fromARGB(255, 73, 23, 188),
      false,
      loremIpsum,
      4,
    ),
  );

  // Intro to Flutter/Sponsor Workshop
  meetings.add(
    Meeting(
      'Intro to Flutter/Sponsor Workshop',
      DateTime(theDay.year, theDay.month, theDay.day, 16),
      DateTime(theDay.year, theDay.month, theDay.day, 17),
      Color.fromARGB(255, 73, 23, 188),
      false,
      loremIpsum,
      5,
    ),
  );

  // Games and Activities
  meetings.add(
    Meeting(
      'Games and Activities',
      DateTime(theDay.year, theDay.month, theDay.day, 17),
      DateTime(theDay.year, theDay.month, theDay.day, 18),
      Color.fromARGB(255, 188, 23, 141),
      false,
      loremIpsum,
      6,
    ),
  );

  // Dinner
  meetings.add(
    Meeting(
      'Dinner',
      DateTime(theDay.year, theDay.month, theDay.day, 18),
      DateTime(theDay.year, theDay.month, theDay.day, 19),
      Color.fromARGB(255, 188, 23, 141),
      false,
      loremIpsum,
      7,
    ),
  );

  // Doors Closed
  meetings.add(
    Meeting(
      'Doors Closed',
      DateTime(theDay.year, theDay.month, theDay.day, 23),
      DateTime(theDay.year, theDay.month, theDay.day, 23),
      Color.fromARGB(255, 188, 23, 141),
      false,
      'Doors will close promptly at 11PM! This is to ensure the safety of all attendees',
      8,
    ),
  );

  // Midnight Snack
  meetings.add(
    Meeting(
      'Midnight Snack',
      DateTime(theDay.year, theDay.month, theDay.day + 1, 00),
      DateTime(theDay.year, theDay.month, theDay.day + 1, 00, 15),
      Color.fromARGB(255, 188, 23, 141),
      false,
      loremIpsum,
      9,
    ),
  );

  // Breakfast
  meetings.add(
    Meeting(
      'Breakfast',
      DateTime(theDay.year, theDay.month, theDay.day + 1, 08),
      DateTime(theDay.year, theDay.month, theDay.day + 1, 09),
      Color.fromARGB(255, 188, 23, 141),
      false,
      loremIpsum,
      10,
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
