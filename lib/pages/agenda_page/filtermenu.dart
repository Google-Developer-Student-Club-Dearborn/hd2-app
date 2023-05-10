import 'package:flutter/material.dart';
import 'package:hd2_app/pages/agenda_page/navbar.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({Key? key, required this.onFilterChanged}) : super(key: key);
  final Function(List<bool>) onFilterChanged;
  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  List<bool> _isCheckedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Show Only:',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 8),
          CheckboxListTile(
            title: Text('Schedule View'),
            value: _isCheckedList[0],
            onChanged: (value) {
              setState(() {
                _isCheckedList[0] = value ?? false;
              });
              
            },
          ),
          CheckboxListTile(
            title: Text('Day View'),
            value: _isCheckedList[1],
            onChanged: (value) {
              setState(() {
                _isCheckedList[1] = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Timeline View'),
            value: _isCheckedList[2],
            onChanged: (value) {
              setState(() {
                _isCheckedList[2] = value ?? false;
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // apply the filters and close the modal
              widget.onFilterChanged(_isCheckedList);
              Navigator.pop(context);
            },
            child: Text('Apply'),
          ),
        ],
      ),
    );
  }
}
