import 'package:flutter/material.dart';
import '../router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import '../model/todo_list.dart';

class GridButton extends StatelessWidget {
  GridButton({
    this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    List categoryList = context.watch<TodoListModel>().categories;
    final categoryObject = categoryList[index];
    return OutlinedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.black54),
          elevation: MaterialStateProperty.all(20),
          side: MaterialStateProperty.all(BorderSide.none),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      onPressed: () {
        AutoRouter.of(context).push(TaskListPageRoute(
          index: index,
        ));
      },
      child: Column(
        children: [
          Icon(
            categoryObject["icon"],
            size: 40,
            color: categoryObject["color"],
          ),
          Container(
              child: Column(children: [
            Text(categoryObject["category"],
                style: TextStyle(fontSize: 24, color: Colors.black)),
            Text('${categoryObject["tasks"].length} Tasks',
                style: TextStyle(color: Colors.black))
          ]))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
