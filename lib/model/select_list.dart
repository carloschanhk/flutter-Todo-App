import 'Todo.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo_list.dart';

class SelectListModel extends ChangeNotifier{
  List _selectedList = [];

  List get selectedList => _selectedList;

  void addSelected(Todo todo){
    _selectedList.add(todo);
  }

  void removeSelected(Todo todo){
    _selectedList.removeWhere((element)=> element == todo);
  }
  void clearSelected(){ _selectedList.clear();}
}