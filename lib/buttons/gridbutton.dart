import 'package:flutter/material.dart';
import 'package:tutorial_1/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import '../model/todo_list.dart';

class GridButton extends StatelessWidget {
  GridButton(
      {this.index,});
  final int index;

  @override
  Widget build(BuildContext context) {
    List categoryList= context.watch<TodoListModel>().categories;
    final categoryObject = categoryList[index];
    return OutlinedButton(
      style: ButtonStyle(),
      onPressed: () {
        AutoRouter.of(context).push(TaskListPageRoute(
          category: categoryObject["category"],
          icon: categoryObject["icon"],
          tasks: categoryObject["tasks"],
        ));
      },
      child: Column(
        children: [
          Icon(categoryObject["icon"],size: 40,),
          Container(
              child: Column(children: [
            Text(categoryObject["category"], style: TextStyle(fontSize: 24, color: Colors.black)),
            Text('${categoryObject["tasks"].length} Tasks', style: TextStyle(color: Colors.black))
          ]))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
