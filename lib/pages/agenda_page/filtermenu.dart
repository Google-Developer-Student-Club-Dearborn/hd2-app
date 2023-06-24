import 'package:flutter/material.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({Key? key, required this.onFilterChanged})
      : super(key: key);
  final Function(List<bool>) onFilterChanged;
  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  final List<bool> _isCheckedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Show Only:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          CheckboxListTile(
            title: const Text('Schedule View'),
            value: _isCheckedList[0],
            activeColor: const Color(0xffff66c4),
            onChanged: (value) {
              setState(() {
                _isCheckedList[0] = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Day View'),
            value: _isCheckedList[1],
            activeColor: const Color(0xffff66c4),
            onChanged: (value) {
              setState(() {
                _isCheckedList[1] = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Timeline View'),
            value: _isCheckedList[2],
            activeColor: const Color(0xffff66c4),
            onChanged: (value) {
              setState(() {
                _isCheckedList[2] = value ?? false;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff007aff),
            ),
            onPressed: () {
              // apply the filters and close the modal
              widget.onFilterChanged(_isCheckedList);
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
