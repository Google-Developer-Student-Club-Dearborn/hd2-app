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
    final theme = Color.fromARGB(256,0, 122, 255);
    final appointment =
        (selectedIndex >= 0 && selectedIndex < appointments.length)
            ? appointments[selectedIndex]
            : null;

    return Scaffold(
      floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 38, right: 20),
          child: FloatingActionButton(
            onPressed: (){if (selectedIndex < appointments.length - 1) {
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
                }}, // Use _showFilterModal as the onPressed callback
            child: Icon(Icons.skip_next_rounded),
            elevation: 4,
          ),
        ),
        
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        color: theme.withOpacity(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: appointment != null
                  ?  Card(
                        color: Color(0xff007aff).withOpacity(0.725),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              appointment != null
                                  ? BigCard(eventName: appointment.eventName)
                                  : Text('No appointment selected'),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Chip(
                                    avatar: Container(
                                      width: 60,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade800,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'From:',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                          ),
                                        ),
                                      ),
                                    ),
                                    backgroundColor: Colors.pink.shade800,
                                    label: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        DateFormat('hh:mm a')
                                            .format(appointment.from)
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Chip(
                                    avatar: Container(
                                      width: 60,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade800,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'To:',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                          ),
                                        ),
                                      ),
                                    ),
                                    backgroundColor: Colors.pink.shade800,
                                    label: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        DateFormat('hh:mm a')
                                            .format(appointment.to)
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                               Card(
                                 color: Color(0xff4169E1).withOpacity(0.0),
                                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                    child: Center(
                                      child: Text(
                                        appointment.description,
                                        style: TextStyle(
                                          fontFamily: 'Source Code Pro',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ),
                      )
                  : Container(),
            ),
                SizedBox(height: 100),
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
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Text(
          eventName,
          style: TextStyle(
            fontFamily: 'Material Icons',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );

  }
}
