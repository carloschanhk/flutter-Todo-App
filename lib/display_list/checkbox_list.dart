import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/dialogs/details_dialog.dart';
import 'package:todo/model/Todo.dart';
import 'package:todo/model/todo_list.dart';
import 'package:provider/provider.dart';

class CheckboxList extends StatelessWidget {
  CheckboxList(
      {this.editTitle,
      this.editNote,
      this.editTime,
      this.onTodoToggle,
      this.categoryObject});
  final Function editTitle;
  final Function editNote;
  final Function editTime;
  final Function onTodoToggle;
  final categoryObject;

  @override
  Widget build(BuildContext context) {
    Function removeTask = context.watch<TodoListModel>().removeTask;

    return ListView.builder(
        itemCount: categoryObject["tasks"].length,
        itemBuilder: (context, i) {
          final Todo todoItem = categoryObject["tasks"][i];
          String formattedDate =
              DateFormat("EEE MMM dd, kk:mm").format(todoItem.todoTime);
          return Dismissible(
              key: Key(todoItem.title),
              onDismissed: (direction) {
                removeTask(todoItem);
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
                        builder: (BuildContext context) {
                          return DetailsDialog(
                              todo: todoItem,
                              editNote: editNote,
                              editTime: editTime,
                              editTitle: editTitle);
                        });
                  },
                  child: CheckboxListTile(
                      value: todoItem.isDone,
                      title: Text(
                        todoItem.title,
                        style: TextStyle(
                            color: todoItem.isDone ? Colors.grey : null,
                            decoration: todoItem.isDone
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      subtitle: Text(
                        formattedDate,
                        style: TextStyle(
                            color: todoItem.isDone
                                ? Colors.grey
                                : Colors.red[300]),
                      ),
                      onChanged: (
                        bool isChecked,
                      ) {
                        onTodoToggle(todoItem, isChecked);
                      })));
        });
  }
}
