import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hd2_app/pages/agenda_page/event_details_page.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void calendarTapped(CalendarTapDetails calendarTapDetails) {
      if (calendarTapDetails.targetElement == CalendarElement.appointment) {
        final tappedAppointment = calendarTapDetails.appointments![0];
        final hdevents = getHDEvents();
        final index = tappedAppointment.index;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EventDetails(hdevents: hdevents, selectedIndex: index)),
        );
      }
    }

    return SfCalendar(
      view: CalendarView.timelineDay,
      initialDisplayDate: DateTime(2023, 10, 21, 10),
      dataSource: HDEventsSource(getHDEvents()),
      showCurrentTimeIndicator: true,
      timeSlotViewSettings: const TimeSlotViewSettings(
        timeIntervalWidth: 100,
      ),
      appointmentTextStyle: const TextStyle(
        fontSize: 9.0,
      ),
      onTap: calendarTapped,
    );
  }
}
