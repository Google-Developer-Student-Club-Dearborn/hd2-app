import 'package:hd2_app/pages/agenda_page/timechips.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';

class SecondRoute extends StatelessWidget {
  final List<Meeting> appointments;
  final int selectedIndex;

  SecondRoute({required this.appointments, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Color.fromARGB(256, 0, 122, 255);
    final appointment =
        (selectedIndex >= 0 && selectedIndex < appointments.length)
            ? appointments[selectedIndex]
            : null;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              if (selectedIndex > 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondRoute(
                      appointments: appointments,
                      selectedIndex: selectedIndex - 1,
                    ),
                  ),
                );
              } else {
                print('reached start');
              }
            }, // Use _showFilterModal as the onPressed callback
            elevation: 4,
            child: const Icon(Icons.skip_previous_rounded),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              if (selectedIndex < appointments.length - 1) {
                Navigator.pushReplacement(
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
            }, // Use _showFilterModal as the onPressed callback
            child: Icon(Icons.skip_next_rounded),
            elevation: 4,
          ),
        ],
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
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:  Column(
                
                children: [
                    
                   appointment != null
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
                                    TimeChips(from: appointment.from, to: appointment.to),
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
                  
                ],
              ),
           
          ),
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
    return Padding(
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
