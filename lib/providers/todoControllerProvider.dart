import 'package:flutter/material.dart';
import 'package:todos_app/model/todoModel.dart';

class TodoControllerProvider extends ChangeNotifier {
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());
  Map<String, List<TodoModel>> allTodos = {};
  List<TodoModel> todosOfSelectedDay = [];

  setSelectedDate(DateTime newSelectedDate) {
    selectedDate = DateUtils.dateOnly(newSelectedDate);
    notifyListeners();
  }

  addTodo(TodoModel newTodo) {
    if (allTodos.containsKey(selectedDate.toString())) {
      allTodos[selectedDate.toString()]!.add(newTodo);
      notifyListeners();
    } else {
      allTodos[selectedDate.toString()] = [newTodo];
      notifyListeners();
    }
  }

  getTodos() {
    todosOfSelectedDay = allTodos[selectedDate.toString()] ?? [];
    notifyListeners();
  }

  updateTodo(int index, TodoModel todo) {
    if (todo != todosOfSelectedDay[index]) {
      /*allTodos[selectedDate.toString()]![index] = TodoModel(
          taskName: todo.taskName,
          taskDescription: todo.taskDescription,
          endDate: todo.endDate);*/
      todosOfSelectedDay[index] = todo;
      notifyListeners();
    }
  }

  deleteTodo(int index) {
    todosOfSelectedDay.removeAt(index);
    notifyListeners();
  }
}
