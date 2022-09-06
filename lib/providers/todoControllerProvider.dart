import 'package:flutter/material.dart';
import 'package:todos_app/model/todoModel.dart';

class TodoControllerProvider extends ChangeNotifier {
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());
  Map<String, List<TodoModel>> allTodo = {};
  List<TodoModel> todosOfSelectedDay = [];

  setSelectedDate(DateTime newSelectedDate) {
    selectedDate = DateUtils.dateOnly(newSelectedDate);
    notifyListeners();
  }

  addTodo(TodoModel newTodo) {
    if (allTodo.containsKey(selectedDate.toString())) {
      allTodo[selectedDate.toString()]!.add(newTodo);
      notifyListeners();
      print(allTodo[selectedDate.toString()]);
    } else {
      allTodo[selectedDate.toString()] = [newTodo];
      notifyListeners();
      print(allTodo[selectedDate.toString()]);
    }
  }

  getTodos() {
    todosOfSelectedDay = allTodo[selectedDate.toString()] ?? [];
    notifyListeners();
  }
}
