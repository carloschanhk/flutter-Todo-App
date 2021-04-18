import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/model/Todo.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/select_list.dart';

class SelectList extends StatefulWidget {
  SelectList({this.categoryObject});
  final categoryObject;
  @override
  _SelectListState createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  MultiSelectController controller = new MultiSelectController();
  List todoList;

  @override
  void initState() {
    todoList = widget.categoryObject["tasks"];
    controller.set(todoList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, i) {
          final Todo todoItem = todoList[i];
          String formattedDate =
              DateFormat("EEE MMM dd, kk:mm").format(todoItem.todoTime);
          return MultiSelectItem(
              isSelecting: true,
              onSelected: () {
                if (controller.isSelected(i)) {
                  context.read<SelectListModel>().removeSelected(todoList[i]);
                } else {
                  context.read<SelectListModel>().addSelected(todoList[i]);
                }
                setState(() {
                  controller.toggle(i);
                });
              },
              child: Container(
                child: ListTile(
                  leading: Container(
                      alignment: Alignment.centerLeft,
                      width: 20,
                      child: controller.isSelected(i)
                          ? Icon(Icons.check)
                          : Icon(Icons.crop_square)),
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
                        color: todoItem.isDone ? Colors.grey : Colors.red[300]),
                  ),
                ),
                decoration: controller.isSelected(i)
                    ? BoxDecoration(color: Colors.grey[300])
                    : BoxDecoration(),
              ));
        });
  }
}
