import 'package:flutter/material.dart';

import '../model/todoModel.dart';
import '../screens/TodosScreen.dart';

class AddNewTodo extends StatefulWidget {
  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  String taskName = '';
  String taskDescription = '';
  DateTime startDate = TodosScreen.selectedDate;
  DateTime endDate = TodosScreen.selectedDate;
  List<TodoModel> todosOfDay = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Add Task',style: Theme.of(context).textTheme.displayLarge,textAlign: TextAlign.center),
            TextFormField(
              validator: (text){
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
                onTap: () async {
                  /// Open Calendar
                  endDate = (await showDatePicker(
                      context: context,
                      initialDate: endDate,
                      firstDate: startDate,
                      lastDate:DateTime(2023,12,31),
                  ))??endDate;
                  setState((){});
                },
                child: Text(
                    '${endDate.day} / ${endDate.month} / ${endDate.year}',
                    style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center)
            ),
            ElevatedButton(
                onPressed: (){
                  saveTodo();
                  },
                child: const Icon(Icons.check))

          ],
        ),
      ),
    );
  }

  void saveTodo() {
    if(!_formKey.currentState!.validate()) return;
    /// todo save todo to locale storage

  }
}
