import 'package:flutter/material.dart';
import 'package:hd2_app/main.dart';
import 'package:provider/provider.dart';

Map<String, int> myMap = {
  'Timeline': 0,
  'Dayview': 1,
  'Scheduleview': 2,
};

class FilterSettings {
  var timeline =
      AgendaItem(buttonName: "Timeline", id: 0, selectionStatus: true);
  var day = AgendaItem(buttonName: "Dayview", id: 1, selectionStatus: true);
  var schedule =
      AgendaItem(buttonName: "Scheduleview", id: 2, selectionStatus: true);
  List<String> allTrues = ['Timeline', 'Dayview', 'Scheduleview'];
}

class AgendaItem {
  bool selectionStatus;
  int id;
  String buttonName;
  AgendaItem(
      {required this.buttonName,
      required this.id,
      required this.selectionStatus});
}

class NavBar extends StatefulWidget {
  final Function(int) onSelectionChanged;

  const NavBar({Key? key, required this.onSelectionChanged}) : super(key: key);

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final navSettingsProvider = Provider.of<MyAppState>(context);
    final settings = navSettingsProvider.filterSettings;
    final amountOfButtons = navSettingsProvider.amountOfButtons;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Builder(
        builder: (context) {
          switch (amountOfButtons) {
            case 1: // display one button
              return OneButton(
                buttonIdentifier: myMap[settings.allTrues[0]]!,
                onSelectionChanged: widget.onSelectionChanged,
                buttonName: settings.allTrues[0],
              );
            case 2:
              return TwoButtons(
                  button1Identifier: myMap[settings.allTrues[0]]!,
                  button2Identifier: myMap[settings.allTrues[1]]!,
                  button1Name: settings.allTrues[0],
                  button2Name: settings.allTrues[1],
                  onSelectionChanged: widget.onSelectionChanged);
            case 3: // display three buttons
              return threeButtons(
                  onSelectionChanged: widget.onSelectionChanged);
            default:
              return threeButtons(
                  onSelectionChanged: widget.onSelectionChanged);
          }
        },
      ),
    );
  }
}

class OneButton extends StatefulWidget {
  final int buttonIdentifier;
  final String buttonName;
  final Function(int) onSelectionChanged;
  const OneButton(
      {Key? key,
      required this.buttonIdentifier,
      required this.onSelectionChanged,
      required this.buttonName})
      : super(key: key);

  @override
  _OneButtonState createState() => _OneButtonState();
}

class _OneButtonState extends State<OneButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            widget.onSelectionChanged(widget.buttonIdentifier);
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xffff66c4)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(widget.buttonName),
          ),
        ),
      ],
    );
  }
}

//twoButtons

class TwoButtons extends StatefulWidget {
  final int button1Identifier;
  final int button2Identifier;
  final String button1Name;
  final String button2Name;
  final Function(int) onSelectionChanged;
  const TwoButtons({
    Key? key,
    required this.button1Identifier,
    required this.button2Identifier,
    required this.button1Name,
    required this.button2Name,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _TwoButtonsState createState() => _TwoButtonsState();
}

class _TwoButtonsState extends State<TwoButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            widget.onSelectionChanged(widget.button1Identifier);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xffff66c4)), // new color here
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(widget.button1Name),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            widget.onSelectionChanged(widget.button2Identifier);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xffff66c4)), // new color here
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(widget.button2Name),
          ),
        ),
      ],
    );
  }
}

//threeButtons

class threeButtons extends StatefulWidget {
  final Function(int) onSelectionChanged;
  const threeButtons({
    Key? key,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _threeButtonsState createState() => _threeButtonsState();
}

class _threeButtonsState extends State<threeButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            widget.onSelectionChanged(0);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xffff66c4)), // new color here
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Schedule'),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            widget.onSelectionChanged(1);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xffff66c4)), // new color here
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Dayview'),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            widget.onSelectionChanged(2);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xffff66c4)), // new color here
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Timeline'),
          ),
        ),
      ],
    );
  }
}
