import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/smallWidgets/updateTodo.dart';
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
    if (todoControllerProvider.firstVisit == null) {
      todoControllerProvider.setStartDate();
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 84,
          child: DatePicker(
            DateTime.fromMicrosecondsSinceEpoch(
                todoControllerProvider.startDate),
            initialSelectedDate: DateTime.now(),
            selectionColor: Theme.of(context).primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              todoControllerProvider.setSelectedDate(date);
              todoControllerProvider.getTodos();
            },
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
            child: ListView.builder(
                itemCount: todoControllerProvider.todosOfSelectedDay.length,
                itemBuilder: (context, index) => SwipeActionCell(
                      key: ObjectKey(
                          todoControllerProvider.todosOfSelectedDay[index]),
                      leadingActions: <SwipeAction>[
                        SwipeAction(
                          content: const Text('Delete'),
                          backgroundRadius: 50,
                          performsFirstActionWithFullSwipe: true,
                          onTap: (CompletionHandler handler) {
                            showCupertinoDialog(
                                context: context,
                                builder: (c) {
                                  return CupertinoAlertDialog(
                                    title: const Text(
                                        'Are You Sure To Delete This Todo?'),
                                    actions: <Widget>[
                                      CupertinoDialogAction(
                                        child: TextButton(
                                          onPressed: () {
                                            todoControllerProvider
                                                .deleteTodo(index);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Text(
                                            'confirm',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                      ),
                                      CupertinoDialogAction(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('cancel')),
                                      )
                                    ],
                                  );
                                });
                          },
                          color: Colors.red,
                        ),
                        SwipeAction(
                            backgroundRadius: 20,
                            title: "Update",
                            onTap: (CompletionHandler handler) {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => UpdateTodo(
                                        todoOfDay: todoControllerProvider
                                            .todosOfSelectedDay[index],
                                        index: index,
                                      ));
                            },
                            color: Theme.of(context).primaryColor),
                      ],
                      child: TodoMission(
                        index: index,
                        todoModel:
                            todoControllerProvider.todosOfSelectedDay[index],
                      ),
                    ))),
      ],
    );
  }
}
