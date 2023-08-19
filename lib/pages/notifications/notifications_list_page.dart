import 'package:flutter/material.dart';
import 'package:hd2_app/constants/hd_constants.dart';
import 'package:hd2_app/models/HDEvent.dart';
import 'package:hd2_app/pages/agenda_page/event_details_page.dart';
import 'package:hd2_app/pages/notifications/notification_detail_page.dart';
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
            if (notification.index >= HDConstants.eventReminderId) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationDetail(
                        hdevents: eventsService.getEventReminders(),
                        selectedIndex: index)),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventDetails(
                        hdevents: eventsService.getEvents(),
                        selectedIndex: index)),
              );
            }
          },
          child: Container(
            height: 90,
            padding: EdgeInsets.only(top: 20, right: 20, left: 16),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              notification.eventName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        notification.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      Text(
                          '${notification.from.day}/${notification.from.month}/${notification.from.year}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          )),
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
