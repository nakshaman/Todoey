import 'package:flutter/material.dart';
import 'package:todoye/task.dart';

class Data extends ChangeNotifier {
  List<Task> tasks = [];

  void add(String taskName) {
    tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void toggle(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }

  void clearAll() {
    tasks.clear();
  }
}
