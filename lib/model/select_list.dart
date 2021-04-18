import 'Todo.dart';
import 'package:flutter/material.dart';

class SelectListModel extends ChangeNotifier {
  List _selectedList = [];

  List get selectedList => _selectedList;

  void addSelected(Todo todo) {
    _selectedList.add(todo);
    notifyListeners();
  }

  void removeSelected(Todo todo) {
    _selectedList.removeWhere((element) => element == todo);
    notifyListeners();
  }

  void clearSelected() {
    _selectedList.clear();
    notifyListeners();
  }
}
