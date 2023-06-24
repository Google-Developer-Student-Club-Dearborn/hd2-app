import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hd2_app/pages/agenda_page/timechips.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';

class SecondRoute extends StatefulWidget {
  final List<Meeting> appointments;
  int selectedIndex;

  SecondRoute({required this.appointments, required this.selectedIndex});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    const theme = Color.fromARGB(256, 0, 122, 255);
    Meeting? appointment = (widget.selectedIndex >= 0 &&
            widget.selectedIndex < widget.appointments.length)
        ? widget.appointments[widget.selectedIndex]
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: EventDetailsBody(theme: theme, appointment: appointment),
      bottomNavigationBar: GNav(
        gap: 8,
        activeColor: const Color.fromARGB(255, 255, 102, 196),
        tabBackgroundColor: Colors.grey.shade800,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutExpo,
        onTabChange: (index) {
          if (index == 0) {
            // Logic for the "Previous" button
            if (widget.selectedIndex > 0) {
              widget.selectedIndex = widget.selectedIndex - 1;

              setState(() {
                appointment = (widget.selectedIndex >= 0 &&
                        widget.selectedIndex < widget.appointments.length)
                    ? widget.appointments[widget.selectedIndex]
                    : null;
              });
            } else {
              print('Reached the start');
            }
          } else if (index == 1) {
            // Logic for the "Next" button
            if (widget.selectedIndex < widget.appointments.length - 1) {
              widget.selectedIndex = widget.selectedIndex + 1;
              setState(() {
                appointment = (widget.selectedIndex >= 0 &&
                        widget.selectedIndex < widget.appointments.length)
                    ? widget.appointments[widget.selectedIndex]
                    : null;
              });
            }
          }
        },
        tabs: const [
          GButton(icon: Icons.arrow_circle_left_rounded, text: 'Previous'),
          GButton(icon: Icons.arrow_circle_right_rounded, text: 'Next'),
        ],
      ),
    );
  }
}

class EventDetailsBody extends StatelessWidget {
  const EventDetailsBody({
    super.key,
    required this.theme,
    required this.appointment,
  });

  final Color theme;
  final Meeting? appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.withOpacity(0.0),
      child:
          // Center and SingleChildScrollView starts here
          Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              appointment != null
                  ? Card(
                      color: const Color(0xff007aff).withOpacity(0.725),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            appointment != null
                                ? BigCard(eventName: appointment!.eventName)
                                : const Text('No appointment selected'),
                            const SizedBox(height: 20),
                            TimeChips(
                                from: appointment!.from, to: appointment!.to),
                            const SizedBox(height: 20),
                            Card(
                              color: const Color(0xff4169E1).withOpacity(0.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Center(
                                  child: Text(
                                    appointment!.description,
                                    style: const TextStyle(
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
      // Center and SingleChildScrollView ends here
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.eventName,
  });

  final String eventName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Text(
        eventName,
        style: const TextStyle(
          fontFamily: 'Material Icons',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
