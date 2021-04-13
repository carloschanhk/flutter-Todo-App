import 'package:flutter/material.dart';
import 'package:tutorial_1/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class GridButton extends StatelessWidget {
  GridButton(
      {this.icon,
      this.category,
      this.tasks,
      this.onTodoToggle,
      this.parentContext});
  final String category;
  final Icon icon;
  final List tasks;
  final Function onTodoToggle;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        AutoRouter.of(parentContext).push(TaskListPageRoute(
          category: category,
          icon: icon,
          tasks: tasks,
          onTodoToggle: onTodoToggle
        ));
      },
      child: Column(
        children: [
          icon,
          Container(
              child: Column(children: [
            Text(category, style: TextStyle(fontSize: 24, color: Colors.black)),
            Text('${tasks.length} Tasks', style: TextStyle(color: Colors.black))
          ]))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
