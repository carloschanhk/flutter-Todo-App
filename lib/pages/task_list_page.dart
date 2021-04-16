import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/display_list/select_list.dart';
import '../model/Todo.dart';
import 'package:provider/provider.dart';
import '../model/todo_list.dart';
import '../dialogs/details_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../display_list/checkbox_list.dart';
import 'package:todo/model/select_list.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({this.index});
  final int index;

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
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
    List categoryList = context.watch<TodoListModel>().categories;
    final categoryObject = categoryList[widget.index];
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: isSelectMode
                ? IconButton(
                    icon: Icon(Icons.delete, color: Colors.white),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                content: Text(
                                    "Are you sure to delete selected items?"),
                                actions: [
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text("Confirm"),
                                    onPressed: () {
                                      List selectedList = context
                                          .read<SelectListModel>()
                                          .selectedList;
                                      for (var item in selectedList) {
                                        context
                                            .read<TodoListModel>()
                                            .removeTask(item);
                                      }
                                      context
                                          .read<SelectListModel>()
                                          .clearSelected();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ]);
                          });
                    },
                  )
                : null,
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: isSelectMode
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        isSelectMode = !isSelectMode;
                      });
                    },
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white)),
                  )
                : PopupMenuButton(
                    icon: SvgPicture.asset(
                      "assets/icons/more_vert_black_24dp.svg",
                      semanticsLabel: "Menu Button",
                    ),
                    offset: Offset(0, 20),
                    onSelected: (value) {
                      print("selected");
                      switch (value) {
                        case 1:
                          break;
                        case 2:
                          print("in select");
                          setState(() {
                            isSelectMode = !isSelectMode;
                          });
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      List<PopupMenuEntry<dynamic>> list = [];
                      list.add(PopupMenuItem(
                          value: 1,
                          child: Container(
                              child: Text(
                            "New Project",
                            style: TextStyle(color: Colors.blue),
                          ))));
                      list.add(PopupMenuDivider(
                        height: 10,
                      ));
                      list.add(PopupMenuItem(
                        value: 2,
                        child: Text("Select",
                            style: TextStyle(color: Colors.blue)),
                      ));
                      return list;
                    },
                  ),
          )
        ],
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 30, top: 15),
          height: 130,
          alignment: Alignment.topLeft,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: Colors.white)),
                child: Icon(categoryObject["icon"], color: Colors.blue)),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(children: [
                Text(
                  categoryObject["category"],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  "${categoryObject["tasks"].length} Tasks",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ]),
            )
          ]),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white),
          child: isSelectMode
              ? SelectList(categoryObject: categoryObject)
              : CheckboxList(
                  editTitle: _editTitle,
                  editNote: _editNote,
                  editTime: _editTime,
                  onTodoToggle: _onTodoToggle,
                  categoryObject: categoryObject,
                ),
        ))
      ]),
      bottomNavigationBar: isSelectMode
          ? BottomAppBar(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                border: Border.all(width: 5,color: Colors.yellow),
                color: Colors.black
              ),

            child: Text("123",style: TextStyle(color: Colors.white),)))
          : null,
    );
  }
}
