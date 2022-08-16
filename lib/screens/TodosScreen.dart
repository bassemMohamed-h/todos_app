import 'package:flutter/material.dart';

import '../smallWidgets/todoMission.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';


class TodosScreen extends StatefulWidget {

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 84,
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor:Theme.of(context).primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              selectedDate = date;
              print(selectedDate);
              setState(() {
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => TodoMission()
            )
        ),
      ],
    );
  }
}
