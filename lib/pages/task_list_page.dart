import 'package:flutter/material.dart';
import 'package:todo/buttons/delete_button.dart';
import 'package:todo/buttons/task_list_menu_button.dart';
import 'package:todo/display_list/select_list.dart';
import '../model/Todo.dart';
import 'package:provider/provider.dart';
import '../model/todo_list.dart';
import '../display_list/checkbox_list.dart';
import 'package:todo/model/select_list.dart';
import 'package:enum_to_string/enum_to_string.dart';
import '../buttons/delete_button.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({this.index});
  final int index;

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  _changeSelectMode() {
    setState(() {
      isSelectMode = !isSelectMode;
    });
  }

  _onTodoToggle(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _editTitle(Todo todo, String newTitle) {
    setState(() {
      todo.title = newTitle;
    });
  }

  _editTime(Todo todo, DateTime newTime) {
    setState(() {
      todo.todoTime = newTime;
    });
  }

  _editNote(Todo todo, String newNote) {
    setState(() {
      todo.note = newNote;
    });
  }

  bool isSelectMode = false;

  @override
  Widget build(BuildContext context) {
    List categoryList = context.read<TodoListModel>().categoryList;
    final categoryObject = categoryList[widget.index];
    return Scaffold(
      backgroundColor: categoryObject.color,
      appBar: AppBar(
        leading: isSelectMode ? Container() : null,
        backgroundColor: categoryObject.color,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: isSelectMode
                ? DeleteButton(
                    changeSelectMode: _changeSelectMode,
                  )
                : null,
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: isSelectMode
                ? TextButton(
                    onPressed: () {
                      context.read<SelectListModel>().clearSelected();
                      _changeSelectMode();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : TaskListMenuButton(
                    changeSelectMode: _changeSelectMode,
                  ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 15),
            height: 130,
            alignment: Alignment.topLeft,
            color: categoryObject.color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                  child: Icon(
                    categoryObject.icon,
                    color: categoryObject.color,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        EnumToString.convertToString(
                            TodoCategory.values[widget.index]),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "${context.watch<TodoListModel>().getTasks(widget.index).length} Tasks",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: AnimatedCrossFade(
                crossFadeState: isSelectMode
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 200),
                firstChild: CheckboxList(
                  editTitle: _editTitle,
                  editNote: _editNote,
                  editTime: _editTime,
                  onTodoToggle: _onTodoToggle,
                  index: widget.index,
                ),
                secondChild: SelectList(index: widget.index),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: isSelectMode
          ? BottomAppBar(
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.blue),
                child: Container(
                  padding: EdgeInsets.only(left: 40),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${context.watch<SelectListModel>().selectedList.length} items selected",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
