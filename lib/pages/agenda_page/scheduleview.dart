import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/agenda_page.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';
import 'package:hd2_app/main.dart';
//calendar library
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.schedule,
      dataSource: MeetingDataSource(getDataSource()),
      scheduleViewSettings: ScheduleViewSettings(
        appointmentItemHeight: 70,
      ),
      showCurrentTimeIndicator: true,
      todayHighlightColor: Color.fromARGB(0, 184, 240, 14),
    );
  }

}