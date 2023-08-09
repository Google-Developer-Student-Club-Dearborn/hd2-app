import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hd2_app/components/event_detail_card.dart';
import 'package:hd2_app/models/HDEvent.dart';
import 'package:flutter/material.dart';

class EventDetailPageArguments {
  int selectedIndex;
  final List<HDEvent> hdevents;

  EventDetailPageArguments(
      {required this.selectedIndex, required this.hdevents});
}

class EventDetails extends StatefulWidget {
  final List<HDEvent> hdevents;
  int selectedIndex;

  EventDetails({required this.hdevents, required this.selectedIndex});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    const theme = Color.fromARGB(256, 0, 122, 255);

    EventDetailPageArguments? args =
        ModalRoute.of(context)?.settings.arguments as EventDetailPageArguments?;
    HDEvent? hdevent = _getSelectedEvent(args);

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
      body: EventDetailCard(theme: theme, hdevent: hdevent),
      bottomNavigationBar: GNav(
        gap: 8,
        activeColor: const Color.fromARGB(255, 255, 102, 196),
        tabBackgroundColor: Colors.grey.shade800,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutExpo,
        onTabChange: (index) {
          if (index == 0) {
            navigateToPreviousEvent(args);
          } else if (index == 1) {
            navigateToNextEvent(args);
          }
        },
        tabs: const [
          GButton(icon: Icons.arrow_circle_left_rounded, text: 'Previous'),
          GButton(icon: Icons.arrow_circle_right_rounded, text: 'Next'),
        ],
      ),
    );
  }

  void navigateToPreviousEvent(EventDetailPageArguments? args) {
    if (widget.selectedIndex > 0) {
      setState(() {
        widget.selectedIndex--;
      });
    } else if (args != null && args.selectedIndex > 0) {
      setState(() {
        args.selectedIndex--;
      });
    } else {
      print('Reached the start');
    }
  }

  void navigateToNextEvent(EventDetailPageArguments? args) {
    if (widget.selectedIndex < widget.hdevents.length - 1) {
      setState(() {
        widget.selectedIndex++;
      });
    } else if (args != null && args.selectedIndex < args.hdevents.length - 1) {
      setState(() {
        args.selectedIndex++;
      });
    } else {
      print("Reached the end");
    }
  }

  HDEvent? _getSelectedEvent(EventDetailPageArguments? args) {
    if (widget.selectedIndex >= 0 &&
        widget.selectedIndex < widget.hdevents.length) {
      return widget.hdevents[widget.selectedIndex];
    } else if (args != null &&
        args.selectedIndex >= 0 &&
        args.selectedIndex < args.hdevents.length) {
      return args.hdevents[args.selectedIndex];
    } else {
      return null;
    }
  }
}
