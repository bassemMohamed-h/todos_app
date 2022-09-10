import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/todoModel.dart';
import '../providers/todoControllerProvider.dart';

class UpdateTodo extends StatefulWidget {
  int index;
  TodoModel todoOfDay;

  UpdateTodo({required this.todoOfDay, required this.index});

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  String taskName = '';

  late String taskDescription;

  late DateTime endDate;

  late TodoControllerProvider todoControllerProvider;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    todoControllerProvider = Provider.of(context);
    if (taskName.isEmpty) {
      taskName = widget.todoOfDay.taskName;
      taskDescription = widget.todoOfDay.taskDescription;
      endDate = widget.todoOfDay.endDate;
    }
    return Container(
      margin: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Update Task',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center),
            TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'please enter title for task';
                } else {
                  return null;
                }
              },
              initialValue: taskName,
              onChanged: (task) {
                taskName = task;
              },
            ),
            TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'please enter description for task';
                } else {
                  return null;
                }
              },
              initialValue: taskDescription,
              maxLines: 3,
              onChanged: (description) {
                taskDescription = description;
              },
            ),
            Text('Update Dead Line Date',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.left),
            InkWell(
                hoverColor: Colors.transparent,
                onTap: () async {
                  /// Open Calendar
                  endDate = (await showDatePicker(
                        context: context,
                        currentDate: todoControllerProvider.selectedDate,
                        initialDate: endDate,
                        firstDate: todoControllerProvider.selectedDate,
                        lastDate: DateTime(2023, 12, 31),
                      )) ??
                      endDate;
                  setState(() {});
                },
                child: Text('${endDate.year}/${endDate.month}/${endDate.day}',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center)),
            ElevatedButton(
                onPressed: () {
                  updateTodo();
                },
                child: const Icon(Icons.check))
          ],
        ),
      ),
    );
  }

  void updateTodo() {
    if (!_formKey.currentState!.validate()) return;
    TodoModel todoModel = TodoModel(
        taskName: taskName, taskDescription: taskDescription, endDate: endDate);

    /// todo save todo to locale storage
    todoControllerProvider.updateTodo(widget.index, todoModel);
    todoControllerProvider.getTodos();
    Navigator.pop(context);
  }
}
