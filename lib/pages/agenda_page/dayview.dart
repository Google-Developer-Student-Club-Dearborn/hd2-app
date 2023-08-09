import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hd2_app/pages/agenda_page/event_details_page.dart';

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
          MaterialPageRoute(
              builder: (context) => EventDetails(
                  appointments: appointments, selectedIndex: index)),
        );
      }
    }

    return SfCalendar(
      view: CalendarView.day,
      initialDisplayDate: DateTime(2023, 10, 21, 10),
      showCurrentTimeIndicator: true,
      dataSource: MeetingDataSource(getDataSource()),
      onTap: calendarTapped,
    );
  }
}
