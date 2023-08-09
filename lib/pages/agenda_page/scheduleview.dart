import 'package:flutter/material.dart';
import 'package:hd2_app/shared/getHDEvents.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hd2_app/pages/agenda_page/event_details_page.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({
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
      view: CalendarView.schedule,
      initialDisplayDate: DateTime(2023, 10, 21, 10),
      dataSource: HDEventsSource(getHDEvents()),
      scheduleViewSettings: const ScheduleViewSettings(
        appointmentItemHeight: 70,
      ),
      showCurrentTimeIndicator: true,
      onTap: calendarTapped,
    );
  }
}
