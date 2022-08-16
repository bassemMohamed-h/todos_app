import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 100,
      child: DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.black,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            // New date selected
            setState(() {
            });
          },
      ),
    );
  }
}
