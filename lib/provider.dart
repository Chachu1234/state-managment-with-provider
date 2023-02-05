import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  late String name;
  List<String> todos = [];
  List<String> get getTodos => todos;
  void todoAdd(String todo) {
    todos.add(todo);
    notifyListeners();
  }

  void todoRemove(String todo) {
    todos.remove(todo);
  }
}
