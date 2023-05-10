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
    void calendarTapped(CalendarTapDetails calendarTapDetails) {
      if (calendarTapDetails.targetElement == CalendarElement.appointment) {
        final tappedAppointment = calendarTapDetails.appointments![0];
        final appointments = getDataSource();
        final index = tappedAppointment.index;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute(appointments: appointments, selectedIndex: index)),
        );
      }
    }
    return SfCalendar(
      view: CalendarView.day,
      showCurrentTimeIndicator: true,
      dataSource: MeetingDataSource(getDataSource()),
      onTap: calendarTapped,
    );
  }
}