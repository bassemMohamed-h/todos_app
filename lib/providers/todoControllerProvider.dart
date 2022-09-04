import 'package:flutter/material.dart';
import 'package:todos_app/model/todoModel.dart';

class TodoControllerProvider extends ChangeNotifier {
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());
  Map<String, List<TodoModel>> allTodo = {};

  setSelectedDate(DateTime newSelectedDate) {
    selectedDate = DateUtils.dateOnly(newSelectedDate);
    notifyListeners();
  }

  addTodo(TodoModel newTodo) {
    allTodo.forEach((key, value) {
      if (selectedDate.toString() == key) {
        value.add(newTodo);
        notifyListeners();
        return;
      }
    });
    allTodo[selectedDate.toString()] = [newTodo];
    notifyListeners();
  }
}
