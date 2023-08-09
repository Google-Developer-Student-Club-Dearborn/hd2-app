import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hd2_app/components/event_detail_card.dart';
import 'package:hd2_app/shared/HDEvent.dart';
import 'package:hd2_app/shared/RouteArguments.dart';
import 'package:flutter/material.dart';

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

    RouteArguments? args =
        ModalRoute.of(context)?.settings.arguments as RouteArguments?;
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

  void navigateToPreviousEvent(RouteArguments? args) {
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

  void navigateToNextEvent(RouteArguments? args) {
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

  HDEvent? _getSelectedEvent(RouteArguments? args) {
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
