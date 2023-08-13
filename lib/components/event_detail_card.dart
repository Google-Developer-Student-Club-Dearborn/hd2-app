import 'package:hd2_app/models/HDEvent.dart';
import 'package:hd2_app/pages/agenda_page/timechips.dart';
import 'package:flutter/material.dart';

class EventDetailCard extends StatelessWidget {
  const EventDetailCard({
    super.key,
    required this.theme,
    required this.hdevent,
    this.isDateShown = true,
  });

  final Color theme;
  final HDEvent? hdevent;
  final bool isDateShown;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.withOpacity(0.0),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              if (hdevent != null)
                Card(
                  color: const Color(0xff007aff).withOpacity(0.725),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hdevent != null
                            ? BigCard(eventName: hdevent!.eventName)
                            : const Text('No event selected'),
                        if (isDateShown)
                          TimeChips(from: hdevent!.from, to: hdevent!.to),
                        const SizedBox(height: 20),
                        Card(
                          color: const Color(0xff4169E1).withOpacity(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              hdevent!.description,
                              style: const TextStyle(
                                fontFamily: 'Source Code Pro',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Container(),
            ],
          ),
        ),
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        eventName,
        style: const TextStyle(
          fontFamily: 'Material Icons',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
