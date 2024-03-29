import 'package:flutter/material.dart';
import 'package:hd2_app/services/hdevent_service.dart';
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
        final HDEventsService eventsService = HDEventsService();
        final hdevents = eventsService.getEvents();
        final index = tappedAppointment.index;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EventDetails(hdevents: hdevents, selectedIndex: index)),
        );
      }
    }

    final HDEventsService eventsService = HDEventsService();

    return SfCalendar(
      view: CalendarView.day,
      initialDisplayDate: DateTime(2023, 10, 21, 10),
      showCurrentTimeIndicator: true,
      dataSource: HDEventsSource(eventsService.getEvents()),
      onTap: calendarTapped,
    );
  }
}
