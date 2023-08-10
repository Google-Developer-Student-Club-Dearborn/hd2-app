import 'package:flutter/material.dart';
import 'package:hd2_app/models/HDEvent.dart';
import 'package:hd2_app/pages/agenda_page/event_details_page.dart';
import 'package:hd2_app/services/hdevent_service.dart';

class NotificationsListPage extends StatefulWidget {
  @override
  _NotificationsListPageState createState() => _NotificationsListPageState();
}

class _NotificationsListPageState extends State<NotificationsListPage> {
  final HDEventsService eventsService = HDEventsService();
  List<HDEvent> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    filteredEvents = eventsService.getFilteredEvents();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    filteredEvents = eventsService.getFilteredEvents();
  }

  @override
  Widget build(BuildContext context) {
    if (filteredEvents.isEmpty) {
      return Center(
        child: Text(
          'All caught up',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredEvents.length,
      itemBuilder: (context, index) {
        final notification = filteredEvents[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventDetails(
                      hdevents: filteredEvents, selectedIndex: index)),
            );
          },
          child: Container(
            height: 80,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'assets/app_icon.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.eventName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        notification.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
