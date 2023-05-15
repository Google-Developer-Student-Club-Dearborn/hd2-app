import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/getDataSource.dart';

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
              child: Center(
                child: Text(
                  '@',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 255, 102, 196),
            label: Padding(
              padding: EdgeInsets.all(8.0),
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
            avatar: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.purple.shade500,
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
            backgroundColor: Color.fromARGB(255, 255, 102, 196),
            label: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                DateFormat('hh:mm a').format(from).toString(),
              ),
            ),
          ),
          SizedBox(width: 10),
          Chip(
            avatar: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.purple.shade500,
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
            backgroundColor: Color.fromARGB(255, 255, 102, 196),
            label: Padding(
              padding: EdgeInsets.all(8.0),
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
