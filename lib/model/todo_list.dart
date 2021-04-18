import 'Todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TodoListModel extends ChangeNotifier {
  final List _categories = [
    {
      "category": "All",
      "icon": Icons.assignment,
      "tasks": all,
      "color": Colors.blue
    },
    {
      "category": "Work",
      "icon": Icons.work,
      "tasks": work,
      "color": Colors.brown
    },
    {
      "category": "Health",
      "icon": Icons.favorite,
      "tasks": health,
      "color": Colors.red
    },
    {
      "category": "Exercise",
      "icon": FlutterIcons.running_faw5s,
      "tasks": exercise,
      "color": Colors.lime
    },
    {
      "category": "Home",
      "icon": Icons.home,
      "tasks": home,
      "color": Colors.orange
    },
    {
      "category": "Travel",
      "icon": FlutterIcons.plane_faw,
      "tasks": travel,
      "color": Colors.lightGreen
    },
    {
      "category": "Shopping",
      "icon": Icons.shopping_cart,
      "tasks": shopping,
      "color": Colors.purple[300]
    },
    {
      "category": "Leisure",
      "icon": Icons.park,
      "tasks": leisure,
      "color": Colors.green[900]
    },
  ];
  static List work = [];
  static List health = [];
  static List exercise = [];
  static List home = [];
  static List travel = [];
  static List shopping = [];
  static List leisure = [];
  static List all = [];

  List get categories => _categories;

  void addTask(Todo todo) {
    if (todo != null) {
      switch (todo.category) {
        case "Work":
          work.add(todo);
          break;
        case "Health":
          health.add(todo);
          break;
        case "Exercise":
          exercise.add(todo);
          break;
        case "Home":
          home.add(todo);
          break;
        case "Travel":
          travel.add(todo);
          break;
        case "Shopping":
          shopping.add(todo);
          break;
        case "Leisure":
          leisure.add(todo);
          break;
      }
      all.add(todo);
    }
    notifyListeners();
  }

  void removeTask(todo) {
    switch (todo.category) {
      case "Work":
        work.removeWhere((element) => element == todo);
        break;
      case "Health":
        health.removeWhere((element) => element == todo);
        break;
      case "Exercise":
        exercise.removeWhere((element) => element == todo);
        break;
      case "Home":
        home.removeWhere((element) => element == todo);
        break;
      case "Travel":
        travel.removeWhere((element) => element == todo);
        break;
      case "Shopping":
        shopping.removeWhere((element) => element == todo);
        break;
      case "Leisure":
        leisure.removeWhere((element) => element == todo);
        break;
    }
    all.removeWhere((element) => element == todo);
    notifyListeners();
  }
}
