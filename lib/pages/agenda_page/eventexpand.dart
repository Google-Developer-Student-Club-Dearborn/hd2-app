import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';

class SecondRoute extends StatelessWidget {
  Meeting? appointment;
 
  SecondRoute({this.appointment, });
 var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    IconData icon;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        color: Colors.green[700],
        child: Column(
          children: [
            Divider(color: Colors.white,),
            Center(
              child: BigCard(eventName: appointment!.eventName),
            ),
            Divider(color: Colors.white,),
            Center(
              child: Text(
                  DateFormat('MMMM yyyy,hh:mm a').format(appointment!.from,).toString()),
            ),
            Divider(color: Colors.white,),
            Center(
              child: Text(
                  DateFormat('MMMM yyyy,hh:mm a').format(appointment!.to,).toString()),
            ),
            Divider(color: Colors.white,),
            ElevatedButton.icon(
              onPressed: () {
                print('button pressed!');
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
