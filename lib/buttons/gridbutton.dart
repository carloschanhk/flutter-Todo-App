import 'package:flutter/material.dart';
import 'package:todo/model/Todo.dart';
import '../router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import '../model/todo_list.dart';
import 'package:enum_to_string/enum_to_string.dart';

class GridButton extends StatelessWidget {
  GridButton({
    this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final categoryObject = context.watch<TodoListModel>().categoryList[index];
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.black54,
        elevation: 20,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        AutoRouter.of(context).push(TaskListPageRoute(
          index: index,
        ));
      },
      child: Column(
        children: [
          Icon(
            categoryObject.icon,
            size: 40,
            color: categoryObject.color,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  EnumToString.convertToString(TodoCategory.values[index]),
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                Text(
                  '${context.watch<TodoListModel>().getTasks(index).length} Tasks',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
