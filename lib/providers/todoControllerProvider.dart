import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_app/model/todoModel.dart';

class TodoControllerProvider extends ChangeNotifier {
  bool? firstVisit;
  int startDate = DateTime.now().microsecondsSinceEpoch;

  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());
  Map<String, List<TodoModel>> allTodos = {};
  List<TodoModel> todosOfSelectedDay = [];

  setStartDate() async {
    final prefs = await SharedPreferences.getInstance();
    firstVisit = prefs.getBool('firstVisit') ?? true;
    print('Is First Visit : $firstVisit');
    if (firstVisit!) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('firstVisit', false).then((value) async {
        print(' try to add Flag on sharedPref : $value');
        if (value) {
          print(
              'try to set default start date to sharedPref : ${DateTime.now().microsecondsSinceEpoch}');
          await prefs.setInt(
              'startDate', DateTime.now().microsecondsSinceEpoch);
          print('Set Start Date Complete');
          notifyListeners();
        }
      });
    } else {
      print(
          'try to get start Date from SharedPref : ${DateTime.fromMicrosecondsSinceEpoch(startDate)}');
      startDate = prefs.getInt('startDate')!;
      print('get start date from sharedPref success ');
    }
  }

  clearSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear().then((value) => () {
          print('Is Cleared : $value');
        });
    print("Cleared");
  }

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
