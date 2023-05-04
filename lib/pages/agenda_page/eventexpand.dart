import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';
import 'package:hd2_app/pages/agenda_page/agenda_page.dart';
import 'package:hd2_app/main.dart';

class SecondRoute extends StatelessWidget {
  final List<Meeting> appointments;
  final int selectedIndex;

  SecondRoute({required this.appointments, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final appointment =
        (selectedIndex >= 0 && selectedIndex < appointments.length)
            ? appointments[selectedIndex]
            : null;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        color: Colors.green[700],
        child: Column(
          children: [
            Divider(
              color: Colors.white,
            ),
            Center(
              child: appointment != null
                  ? BigCard(eventName: appointment.eventName)
                  : Text('No appointment selected'),
            ),
            Divider(
              color: Colors.white,
            ),
            Center(
              child: appointment != null
                  ? Text(
                      DateFormat('MMMM yyyy,hh:mm a')
                          .format(appointment.from)
                          .toString(),
                    )
                  : Container(),
            ),
            Divider(
              color: Colors.white,
            ),
            Center(
              child: appointment != null
                  ? Text(
                      DateFormat('MMMM yyyy,hh:mm a')
                          .format(appointment.to)
                          .toString(),
                    )
                  : Container(),
            ),
            Divider(
              color: Colors.white,
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (selectedIndex < appointments.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondRoute(
                        appointments: appointments,
                        selectedIndex: selectedIndex + 1,
                      ),
                    ),
                  );
                } else {
                  print('reached end');
                }
              },
              icon: Icon(Icons.skip_next_rounded),
              label: Text('Next Event'),
            ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    required this.eventName,
  });

  final String eventName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(0, 9, 237, 237),
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Text(
          eventName,
          style: TextStyle(
            fontFamily: 'Material Icons',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
