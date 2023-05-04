import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hd2_app/pages/agenda_page/eventexpand.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void calendarTapped(CalendarTapDetails calendarTapDetails){
    if (calendarTapDetails.targetElement == CalendarElement.appointment){
    Meeting appointment = calendarTapDetails.appointments![0];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondRoute(appointment:appointment)),
    );
  }
  }
    return SfCalendar(
      view: CalendarView.timelineDay,
      dataSource: MeetingDataSource(getDataSource()),
      showCurrentTimeIndicator: true,
      todayHighlightColor: Color.fromARGB(0, 185, 8, 229),
      onTap: calendarTapped,
    );
  }
}