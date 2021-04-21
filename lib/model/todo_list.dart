import 'package:flutter/foundation.dart';
import 'Todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:enum_to_string/enum_to_string.dart';

class TodoListModel extends ChangeNotifier {
  final List<CategoryData> _categoryList = [
    CategoryData(Icons.assignment, Colors.blue),
    CategoryData(Icons.work, Colors.brown),
    CategoryData(Icons.favorite, Colors.red),
    CategoryData(FlutterIcons.running_faw5s, Colors.lime),
    CategoryData(Icons.home, Colors.orange),
    CategoryData(FlutterIcons.plane_faw, Colors.lightGreen),
    CategoryData(Icons.shopping_cart, Colors.purple[300]),
    CategoryData(Icons.park, Colors.green[900]),
  ];

  static List all = [];

  getTasks(index) {
    if (EnumToString.convertToString(TodoCategory.values[index]) == 'All') {
      return all;
    } else {
      return all
          .where(
            (todo) =>
                todo.category ==
                EnumToString.convertToString(TodoCategory.values[index]),
          )
          .toList();
    }
  }

  List get categoryList => _categoryList;

  void addTask(Todo todo) {
    if (todo != null) {
      all.add(todo);
    }
    notifyListeners();
  }

  void removeTask(todo) {
    all.removeWhere((element) => element == todo);
    notifyListeners();
  }
}

class CategoryData {
  final IconData icon;
  final Color color;

  CategoryData(this.icon, this.color);
}
