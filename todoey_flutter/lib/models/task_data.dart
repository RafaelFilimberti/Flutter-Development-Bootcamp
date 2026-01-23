import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {

  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy vap'),
    Task(name: 'Buy violao'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount => _tasks.length;

  void addTask(String newTasKTitle) {
    final task = Task(name: newTasKTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

}