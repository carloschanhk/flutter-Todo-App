import 'package:flutter/material.dart';
import 'package:tutorial_1/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class GridButton extends StatelessWidget {
  GridButton(
      {this.icon,
      this.category,
      this.tasks,
      this.parentContext,
      this.removeTask,});
  final String category;
  final IconData icon;
  final List tasks;
  final BuildContext parentContext;
  final Function removeTask;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(),
      onPressed: () {
        AutoRouter.of(parentContext).push(TaskListPageRoute(
          category: category,
          icon: icon,
          tasks: tasks,
          removeTask: removeTask,
        ));
      },
      child: Column(
        children: [
          Icon(icon,size: 40,),
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
