import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Todo.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({this.icon, this.category, this.tasks, this.onTodoToggle});
  final String category;
  final Icon icon;
  final List tasks;
  final Function onTodoToggle;

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  _onTodoToggle(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.menu)],
      ),
      body: Column(children: [
        Container(
          child: Column(children: [
            widget.icon,
            Text(widget.category),
            Text("${widget.tasks.length} Tasks")
          ]),
        ),
        Container(
            child: Expanded(
          child: ListView.builder(
              itemBuilder: (context, i) {
                String formattedDate = DateFormat("EEE MMM dd, kk:mm")
                    .format(widget.tasks[i].todoTime);
                return CheckboxListTile(
                    value: widget.tasks[i].isDone,
                    title: Text(widget.tasks[i].title),
                    subtitle: Text(formattedDate),
                    onChanged: (
                      bool isChecked,
                    ) {
                      _onTodoToggle(widget.tasks[i], isChecked);
                    });
              },
              itemCount: widget.tasks.length),
        ))
      ]),
    );
  }
}
