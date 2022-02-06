// ignore_for_file: prefer_final_fields
import 'package:flutter/foundation.dart';
import 'package:todoey_app/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String? newTask) {
    _tasks.add(Task(taskName: newTask!));
    notifyListeners();
  }

  void deleteTask(index) {
    _tasks.removeAt(index);
    notifyListeners();
  }


  void checkOffTask(index, checkBoxState) {
    _tasks[index].isChecked = checkBoxState;
    notifyListeners();
  }
}