import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import the three view's files
import 'package:hd2_app/pages/agenda_page/scheduleview.dart';
import 'package:hd2_app/pages/agenda_page/timelineview.dart';
import 'package:hd2_app/pages/agenda_page/dayview.dart';
import 'package:hd2_app/pages/agenda_page/filtermenu.dart';
import 'package:hd2_app/pages/agenda_page/navbar.dart';
import 'package:hd2_app/main.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({
    super.key,
  });

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => FilterModal(
          onFilterChanged: updateIsCheckedList,
      ),
    );
  }

  void updateIsCheckedList(List<bool> isCheckedList) {
  final navSettingsProvider = Provider.of<MyAppState>(context, listen: false);
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
    navSettingsProvider.selection = (myMap[allTrues.first]!);
    navSettingsProvider.allTrues = allTrues;
    navSettingsProvider.amountOfButtons = allTrues.length;
  }
  else if (allTrues.length == 2){
    navSettingsProvider.selection = (myMap[allTrues.first]!);
    navSettingsProvider.allTrues = allTrues;
    navSettingsProvider.amountOfButtons = allTrues.length;
  }
  else if (allTrues.length == 3 || (allTrues.isEmpty)){
    navSettingsProvider.allTrues = ['Timeline', 'Dayview', 'Scheduleview'];
    navSettingsProvider.amountOfButtons = 3;
  }
  
  
}


  @override
  Widget build(BuildContext context) {
    final navSettingsProvider = Provider.of<MyAppState>(context);
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
                switch (navSettingsProvider.selection) {
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
          if (navSettingsProvider.amountOfButtons != 1)
            NavBar(onSelectionChanged: navSettingsProvider.setSelection),
        ],
      ),
    );
  }
}
