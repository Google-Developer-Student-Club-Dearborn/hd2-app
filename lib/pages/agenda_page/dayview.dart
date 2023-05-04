import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hd2_app/pages/agenda_page/eventexpand.dart';

class Dayview extends StatelessWidget {
  const Dayview({
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
      view: CalendarView.day,
      dataSource: MeetingDataSource(getDataSource()),
      showCurrentTimeIndicator: true,
      todayHighlightColor: Color.fromARGB(0, 184, 240, 14),
      onTap: calendarTapped,
    );
  }
}