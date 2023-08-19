import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hd2_app/components/event_detail_card.dart';
import 'package:hd2_app/constants/hd_constants.dart';
import 'package:hd2_app/models/HDEvent.dart';
import 'package:flutter/material.dart';

class NotificationDetailPageArguments {
  int selectedIndex;
  final List<HDEvent> hdevents;

  NotificationDetailPageArguments(
      {required this.selectedIndex, required this.hdevents});
}

class NotificationDetail extends StatefulWidget {
  final List<HDEvent> hdevents;
  int selectedIndex;

  NotificationDetail({required this.hdevents, required this.selectedIndex});

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    const theme = Color.fromARGB(256, 0, 122, 255);

    NotificationDetailPageArguments? args = ModalRoute.of(context)
        ?.settings
        .arguments as NotificationDetailPageArguments?;
    HDEvent? hdevent = _getSelectedEvent(args);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: EventDetailCard(
        theme: theme,
        hdevent: hdevent,
        isDateShown: hdevent != null &&
                hdevent.index != null &&
                hdevent.index >= HDConstants.eventReminderId
            ? false
            : true,
      ),
    );
  }

  HDEvent? _getSelectedEvent(NotificationDetailPageArguments? args) {
    if (widget.selectedIndex >= 0 &&
        widget.selectedIndex < widget.hdevents.length) {
      return widget.hdevents[widget.selectedIndex];
    } else if (args != null && args.selectedIndex >= 0) {
      return args.hdevents
          .firstWhere((event) => event.index == args.selectedIndex);
    } else {
      return null;
    }
  }
}
