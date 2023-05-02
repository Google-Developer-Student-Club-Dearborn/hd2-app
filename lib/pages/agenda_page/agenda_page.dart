import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/scheduleview.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';
//calendar library
import 'package:syncfusion_flutter_calendar/calendar.dart';


class AgendaPage extends StatefulWidget {
  const AgendaPage({
    super.key,
  });

  @override
  State<AgendaPage> createState() => _AgendaPageState();

}

class _AgendaPageState extends State<AgendaPage> {
  int selekshun = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                switch (selekshun) {
                  case 0:
                    return const Timeline();
                  case 1:
                    return const Dayview();
                  case 2:
                    return const ScheduleView();
                  default:
                    return const ScheduleView();
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selekshun = 1;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 102, 187, 106)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('Dayview'),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selekshun = 0;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 102, 187, 106)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('Timeline'),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selekshun = 2;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 102, 187, 106)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('Scheduleview'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class Dayview extends StatelessWidget {
  const Dayview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.day,
      dataSource: MeetingDataSource(getDataSource()),
      showCurrentTimeIndicator: true,
      todayHighlightColor: Color.fromARGB(0, 184, 240, 14),
    );
  }
}

class Timeline extends StatelessWidget {
  const Timeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.timelineDay,
      dataSource: MeetingDataSource(getDataSource()),
      showCurrentTimeIndicator: true,
      todayHighlightColor: Color.fromARGB(0, 185, 8, 229),
    );
  }
}




