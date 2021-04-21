import 'package:flutter/material.dart';
import 'package:todo/model/select_list.dart';
import 'package:todo/model/todo_list.dart';
import 'package:provider/provider.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key key, this.changeSelectMode}) : super(key: key);
  final Function changeSelectMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.delete, color: Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(
                  "Are you sure to delete selected items?",
                ),
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
                      List selectedList =
                          context.read<SelectListModel>().selectedList;
                      for (var item in selectedList) {
                        context.read<TodoListModel>().removeTask(item);
                      }
                      context.read<SelectListModel>().clearSelected();
                      Navigator.of(context).pop();
                      changeSelectMode();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
