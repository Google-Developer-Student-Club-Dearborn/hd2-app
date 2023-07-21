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

  //the "isCheckedList" holds one bool for each view in the agenda page
  //"allTrues" is resized as necessary to hold all the names of the views
  //defaults to holding the names of all the views

  void updateIsCheckedList(List<bool> isCheckedList) {
    final navSettingsProvider = MyApp.of(context);
    List<String> allTrues = [];
    if (isCheckedList[0] == true) {
      allTrues.add('Scheduleview');
    }
    if (isCheckedList[1] == true) {
      allTrues.add('Dayview');
    }
    if (isCheckedList[2] == true) {
      allTrues.add('Timeline');
    }

    if (allTrues.length == 1) {
      navSettingsProvider.selection = (myMap[allTrues.first]!);
      navSettingsProvider.allTrues = allTrues;
      navSettingsProvider.amountOfButtons = allTrues.length;
    } else if (allTrues.length == 2) {
      navSettingsProvider.selection = (myMap[allTrues.first]!);
      navSettingsProvider.allTrues = allTrues;
      navSettingsProvider.amountOfButtons = allTrues.length;
    } else if (allTrues.length == 3 || (allTrues.isEmpty)) {
      navSettingsProvider.allTrues = ['Timeline', 'Dayview', 'Scheduleview'];
      navSettingsProvider.amountOfButtons = 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final navSettingsProvider = MyApp.of(context);
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 38, right: 0),
        child: FloatingActionButton(
          onPressed: _showFilterModal,
          backgroundColor: const Color(0xff007aff),
          foregroundColor: Colors.white,
          elevation: 4,
          child: const Icon(Icons.filter_list),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                switch (navSettingsProvider.selection) {
                  case 0:
                    return const ScheduleView();
                  case 1:
                    return const Dayview();
                  case 2:
                    return const Timeline();
                  default:
                    return const ScheduleView();
                }
              },
            ),
          ),
          //only show the NavBar if one view is selected by the user
          if (navSettingsProvider.amountOfButtons != 1)
            NavBar(onSelectionChanged: navSettingsProvider.setSelection),
        ],
      ),
    );
  }
}
