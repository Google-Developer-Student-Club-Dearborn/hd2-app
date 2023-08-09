import 'package:flutter/material.dart';

class HDEvent {
  HDEvent(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.description, this.index);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  int index;
  String description;
}
