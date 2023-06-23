import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

// ChangeNotifier class is convert class(TaskData) to make it listenable
class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  Future<void> saveTasksForDate(String date) async {
    if (!tasks.isEmpty) {
      final pref = await SharedPreferences.getInstance();

      var data = [];
      tasks.forEach((task) {
        data.add({'name': task.name, 'isDone': task.isDone});
      });

      var dataToJson = jsonEncode(data);

      pref.setString(date, dataToJson);
      print(dataToJson);
      print("saved");
    } else {
      print('cannot save, not tasks');
      tasks = [];
    }
    notifyListeners();
  }

  Future<void> getTasksForDate(String date) async {
    final pref = await SharedPreferences.getInstance();

    String dataJson = pref.getString(date) ?? 'no tasks';
    print(date);
    if (dataJson != 'no tasks') {
      var dataFromJson = jsonDecode(dataJson);
      print(dataFromJson);
      tasks = [];
      dataFromJson.forEach((task) {
        tasks.add(Task(name: task['name'], isDone: task['isDone']));
      });

      print(tasks);
    } else {
      tasks = [];
      print('no tasks');
    }

    notifyListeners();
  }

  Future<void> clearTasksForDate(String date) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove(date);
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    // To tell widgets about the change that happened on task object
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void clearTasksList() {
    tasks.clear();
    notifyListeners();
  }
}

class Date extends ChangeNotifier {
  String date = "";

  void setDate(String d) {
    date = d;
    notifyListeners();
  }
}
