import 'package:flutter/material.dart';

Map<String, int> myMap = {
  'Timeline': 0,
  'Dayview': 1,
  'Scheduleview': 2,
};

class filterSettings {
  var timeline =
      agendaItem(buttonName: "Timeline", id: 0, selectionStatus: true);
  var day = agendaItem(buttonName: "Dayview", id: 1, selectionStatus: true);
  var schedule =
      agendaItem(buttonName: "Scheduleview", id: 2, selectionStatus: true);
  List<String> allTrues = ['Timeline', 'Dayview', 'Scheduleview'];
}

class agendaItem {
  bool selectionStatus;
  int id;
  String buttonName;
  agendaItem(
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
  int amountOfButtons = 3;
  filterSettings settings = filterSettings();

  @override
  Widget build(BuildContext context) {
    print('NavBar is being rebuilt');
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
              return TwoButtons(button1Identifier: myMap[settings.allTrues[0]]!,
                  button2Identifier: myMap[settings.allTrues[1]]!,
                  button1Name: settings.allTrues[0],
                  button2Name: settings.allTrues[1],
                  onSelectionChanged: widget.onSelectionChanged);
            case 3: // display three buttons
              return threeButtons(onSelectionChanged: widget.onSelectionChanged);
            default:
              return threeButtons(onSelectionChanged: widget.onSelectionChanged);
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
  OneButton(
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
            setState(() {
              widget.onSelectionChanged(widget.buttonIdentifier);
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xffff66c4)),
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
  TwoButtons(
      {Key? key,
        required this.button1Identifier,
        required this.button2Identifier,
        required this.button1Name,
        required this.button2Name,
        required this.onSelectionChanged,
       })
      : super(key: key);

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
            setState(() {
              widget.onSelectionChanged(widget.button1Identifier);
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xffff66c4)), // new color here
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
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.onSelectionChanged(widget.button2Identifier);
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xffff66c4)), // new color here
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
  threeButtons({
    Key? key,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _threeButtonsState createState() => _threeButtonsState();
}

class _threeButtonsState extends State<threeButtons> {
  int _selection = 0;
  @override
  Widget build(BuildContext context) {
    print('three button view accessed');
    return Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(
      onPressed: () {
        setState(() {
          _selection = 1;
        });
        widget.onSelectionChanged(_selection);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xffff66c4)), // new color here
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text('Dayview'),
      ),
    ),
    SizedBox(width: 10),
    ElevatedButton(
      onPressed: () {
        setState(() {
          _selection = 0;
        });
        widget.onSelectionChanged(_selection);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xffff66c4)), // new color here
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text('Timeline'),
      ),
    ),
    SizedBox(width: 10),
    ElevatedButton(
      onPressed: () {
        setState(() {
          _selection = 2;
        });
        widget.onSelectionChanged(_selection);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xffff66c4)), // new color here
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text('Schedule'),
      ),
    ),
  ],
);

  }
}
