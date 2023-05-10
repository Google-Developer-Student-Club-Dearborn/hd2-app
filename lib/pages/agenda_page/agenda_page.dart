import 'package:flutter/material.dart';
//import the three view's files
import 'package:hd2_app/pages/agenda_page/scheduleview.dart';
import 'package:hd2_app/pages/agenda_page/timelineview.dart';
import 'package:hd2_app/pages/agenda_page/dayview.dart';
import 'package:hd2_app/pages/agenda_page/filtermenu.dart';
import 'package:hd2_app/pages/agenda_page/navbar.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({
    super.key,
  });

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  int selekshun = 0;
  final GlobalKey<NavBarState> _navBarKey = GlobalKey<NavBarState>();

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => FilterModal(
          onFilterChanged: updateIsCheckedList,
      ),
    );
  }

  void updateIsCheckedList(List<bool> isCheckedList) {
  int amount = 0;
  List<String> allTrues = [];
  if (isCheckedList[0] == true){
    allTrues.add('Scheduleview');
  }
  if (isCheckedList[1]== true){
    allTrues.add('Dayview');
  }
  if (isCheckedList[2]== true){
    allTrues.add('Timeline');
  }

  if (allTrues.length == 1){
    amount = allTrues.length;
    setState(() {
    _navBarKey.currentState?.settings.allTrues = allTrues;
    _navBarKey.currentState?.amountOfButtons = amount;
    });
  }
  else if (allTrues.length == 2){
    amount = allTrues.length;
    setState(() {
    _navBarKey.currentState?.settings.allTrues = allTrues;
    _navBarKey.currentState?.amountOfButtons = amount;
    });
  }
  else if (allTrues.length == 3 || (allTrues.isEmpty)){
    setState(() {
    _navBarKey.currentState?.settings.allTrues = ['Timeline', 'Dayview', 'Scheduleview'];
    _navBarKey.currentState?.amountOfButtons = 3;
    });
  }
  
  
}


  void onSelectionChanged(int selection) {
    setState(() {
      selekshun = selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 38, right: 0),
          child: FloatingActionButton(
            onPressed: _showFilterModal, // Use _showFilterModal as the onPressed callback
            child: Icon(Icons.filter_list),
            elevation: 4,
          ),
        ),
      body: Column(
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                switch (selekshun) {
                  case 0:
                    return const Timeline();
                  case 1:
                    return const Dayview();
                  case 2:
                    return const ScheduleView();
                  default:
                    return const ScheduleView();
                }
              },
            ),
          ),
          NavBar(key: _navBarKey,onSelectionChanged: onSelectionChanged),
        ],
      ),
    );
  }
}
