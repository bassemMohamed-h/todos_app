import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todoModel.dart';
import '../providers/todoControllerProvider.dart';

class AddNewTodo extends StatefulWidget {
  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  late TodoControllerProvider todoControllerProvider;
  String taskName = '';
  String taskDescription = '';
  DateTime? endDate;
  List<TodoModel> todosOfDay = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    todoControllerProvider = Provider.of(context);
    endDate ??= DateUtils.dateOnly(todoControllerProvider.selectedDate);
    return Container(
      margin: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Add Task',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center),
            TextFormField(
              validator: (text) {
                if(text==null || text.isEmpty){
                  return 'please enter title for task';
                }else{return null;}
              },
              decoration: const InputDecoration(
                hintText: 'Please Add New Task',
              ),
              onChanged: (task){taskName = task;},
            ),
            TextFormField(
              validator: (text){
                if(text==null || text.isEmpty){
                  return 'please enter description for task';
                }else{return null;}
              },
              decoration: const InputDecoration(
                hintText: 'Add description To task',
              ),
              maxLines: 3,
              onChanged: (description){taskDescription = description;},
            ),
            Text('Select Dead Line Date',style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.left),
            InkWell(
                hoverColor: Colors.transparent,
                onTap: () async {
                  /// Open Calendar
                  endDate = (await showDatePicker(
                    context: context,
                        currentDate: todoControllerProvider.selectedDate,
                        initialDate: endDate!,
                        firstDate: todoControllerProvider.selectedDate,
                        lastDate: DateTime(2023, 12, 31),
                      )) ??
                      endDate;
                  setState(() {});
                },
                child: Text(
                    '${endDate!.year}/${endDate!.month}/${endDate!.day}',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center)),
            ElevatedButton(
                onPressed: (){
                  saveTodo();
                  Navigator.pop(context);
                },
                child: const Icon(Icons.check))

          ],
        ),
      ),
    );
  }

  void saveTodo() {
    if (!_formKey.currentState!.validate()) return;
    TodoModel todoModel = TodoModel(
        taskName: taskName,
        taskDescription: taskDescription,
        endDate: endDate!);

    /// todo save todo to locale storage
    todoControllerProvider.addTodo(todoModel);
    todoControllerProvider.getTodos();
  }
}
