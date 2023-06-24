import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TimeChips extends StatelessWidget {
  final DateTime from;
  final DateTime to;

  const TimeChips({Key? key, required this.from, required this.to})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (from == to) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Chip(
            avatar: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.purple.shade500,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  '@',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 255, 102, 196),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat('hh:mm a').format(from).toString(),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Chip(
            backgroundColor: const Color.fromARGB(255, 255, 102, 196),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat('hh:mm a').format(from).toString(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            '-',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 10),
          Chip(
            backgroundColor: const Color.fromARGB(255, 255, 102, 196),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat('hh:mm a').format(to).toString(),
              ),
            ),
          ),
        ],
      );
    }
  }
}
