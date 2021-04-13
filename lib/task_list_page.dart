import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Todo.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({this.icon, this.category, this.tasks, this.removeTask,this.onTodoToggle});
  final String category;
  final IconData icon;
  List tasks;
  final Function removeTask;
  final Function onTodoToggle;

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
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
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Colors.white),
                child: Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, i) {
                        final Todo todoItem = widget.tasks[i];
                        String formattedDate = DateFormat("EEE MMM dd, kk:mm")
                            .format(todoItem.todoTime);
                        return Dismissible(
                            key: Key(todoItem.title),
                            onDismissed: (direction) {
                              widget.removeTask.call(todoItem,i);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${todoItem.title} removed")));
                            },
                            background: Container(
                              color: Colors.red,
                              child: Text("Remove"),
                            ),
                            child: CheckboxListTile(
                                value: todoItem.isDone,
                                title: Text(todoItem.title),
                                subtitle: Text(
                                  formattedDate,
                                  style: TextStyle(color: Colors.red[300]),
                                ),
                                onChanged: (bool isChecked,) {
                                  widget.onTodoToggle.call(todoItem, isChecked);
                                }
                                ));
                      },
                      itemCount: widget.tasks.length),
                )))
      ]),
    );
  }
}
