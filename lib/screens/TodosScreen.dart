import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todoControllerProvider.dart';
import '../smallWidgets/todoMission.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';


class TodosScreen extends StatefulWidget {

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  late TodoControllerProvider todoControllerProvider;

  @override
  Widget build(BuildContext context) {
    todoControllerProvider = Provider.of(context);
    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 84,
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Theme.of(context).primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              todoControllerProvider.setSelectedDate(date);
            },
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => TodoMission(index: index))
        ),
      ],
    );
  }
}
