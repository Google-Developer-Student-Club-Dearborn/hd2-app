import 'package:flutter/material.dart';

class CheckboxListWidget extends StatefulWidget {
  const CheckboxListWidget({
    Key? key,
    required this.onFilterChanged,
    required this.titles,
  }) : super(key: key);

  final Function(List<bool>) onFilterChanged;
  final List<String> titles;

  @override
  _CheckboxListWidgetState createState() => _CheckboxListWidgetState();
}

class _CheckboxListWidgetState extends State<CheckboxListWidget> {
  late List<bool> _isCheckedList;

  @override
  void initState() {
    super.initState();
    _isCheckedList = List<bool>.filled(widget.titles.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.titles.length, (index) {
          return CheckboxListTile(
            title: Text(widget.titles[index]),
            value: _isCheckedList[index],
            activeColor: const Color(0xffff66c4),
            onChanged: (value) {
              setState(() {
                _isCheckedList[index] = value ?? false;
              });
              widget.onFilterChanged(_isCheckedList);
            },
          );
        }),
      ),
    );
  }
}
