import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key key, this.title, this.selected, this.onChangedValue})
      : super(key: key);

  final String title;
  final String selected;
  final ValueChanged<String> onChangedValue;
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = 'Default';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String newValue) {
        widget.onChangedValue(newValue);
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Default', 'Llamar', 'Work']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
