import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Todo.dart';
import 'package:provider/provider.dart';
import '../model/todo_list.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({this.icon, this.category, this.tasks});
  final String category;
  final IconData icon;
  List tasks;

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  _onTodoToggle(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Function removeTask = context.watch<TodoListModel>().removeTask;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.menu))
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
                child: Icon(widget.icon, color: Colors.blue)),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(children: [
                Text(
                  widget.category,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  "${widget.tasks.length} Tasks",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ]),
            )
          ]),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white),
          child: ListView.builder(
              itemBuilder: (context, i) {
                final Todo todoItem = widget.tasks[i];
                String formattedDate =
                    DateFormat("EEE MMM dd, kk:mm").format(todoItem.todoTime);
                return Dismissible(
                    key: Key(todoItem.title),
                    onDismissed: (direction) {
                      removeTask(todoItem, i);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${todoItem.title} removed")));
                    },
                    background: Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        "Remove",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    child: GestureDetector(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Text("${todoItem.title}"),
                                    content: Stack(children: [
                                      Container(
                                          child: Text(
                                        "Time: $formattedDate",
                                        style:
                                            TextStyle(color: Colors.red[300]),
                                      )),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30),
                                          child: Text("Note: ${todoItem.note}"))
                                    ]),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    AlertDialog(
                                                      title: Text("Edit Todo"),
                                                      content: Form(
                                                          key: _formKey,
                                                          child:
                                                              Stack(children: [
                                                            TextFormField(
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                    .isEmpty) {
                                                                  return "Please enter your task!";
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                              controller:
                                                                  new TextEditingController(),
                                                              maxLines: 2,
                                                              decoration:
                                                                  InputDecoration(
                                                                      hintText:
                                                                          "What are you planning?"),
                                                            ),
                                                            
                                                          ])),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child:
                                                                Text("Cancel"))
                                                      ],
                                                    ));
                                          },
                                          child: Text("Edit")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK")),
                                    ],
                                  ));
                        },
                        child: CheckboxListTile(
                            value: todoItem.isDone,
                            title: Text(todoItem.title),
                            subtitle: Text(
                              formattedDate,
                              style: TextStyle(color: Colors.red[300]),
                            ),
                            onChanged: (
                              bool isChecked,
                            ) {
                              _onTodoToggle(todoItem, isChecked);
                            })));
              },
              itemCount: widget.tasks.length),
        ))
      ]),
    );
  }
}
