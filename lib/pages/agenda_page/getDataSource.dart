import 'package:firebase_database/firebase_database.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

Future<List<Meeting>> getDataSource() async {
  final List<Meeting> meetings = <Meeting>[];

  const String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('agenda').get();
  Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
  int c = 0;
  for (var entry in values.entries) {
    var value = entry.value as Map<dynamic, dynamic>;
    // print(
    //     '$c ${value["title"]}, ${DateTime.fromMillisecondsSinceEpoch(value["start"])}, ${DateTime.fromMillisecondsSinceEpoch(value["end"])}');
    meetings.add(
      Meeting(
        value["title"],
        DateTime.fromMillisecondsSinceEpoch(value["start"]),
        DateTime.fromMillisecondsSinceEpoch(value["end"]),
        const Color.fromARGB(255, 73, 23, 188),
        false,
        loremIpsum,
        c++,
      ),
    );
  }

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
