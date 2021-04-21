import 'package:flutter/material.dart';
import '../buttons/time_button.dart';
import '../model/Todo.dart';
import 'package:auto_route/auto_route.dart';

class DetailsDialog extends StatefulWidget {
  DetailsDialog({this.editTitle, this.editNote, this.editTime, this.todo});
  final Function editTitle;
  final Function editNote;
  final Function editTime;
  final Todo todo;

  @override
  _DetailsDialogState createState() => _DetailsDialogState();
}

class _DetailsDialogState extends State<DetailsDialog> {
  _DetailsDialogState();
  final _formKey = GlobalKey<FormState>();
  DateTime todoTime;
  TextEditingController titleController;
  TextEditingController noteController;
  @override
  void initState() {
    todoTime = widget.todo.todoTime;
    titleController = new TextEditingController(text: widget.todo.title);
    noteController = new TextEditingController(text: widget.todo.note);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setTime(newTime) {
      setState(() {
        todoTime = newTime;
      });
    }

    return AlertDialog(
      title: Text("Todo Details"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: TextFormField(
                minLines: 1,
                maxLines: 3,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter your task!";
                  } else {
                    return null;
                  }
                },
                controller: titleController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.edit),
                  icon: Icon(Icons.assignment),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TimeButton(
                setTime: setTime,
                todoTime: todoTime,
              ),
            ),
            Container(
              child: TextFormField(
                minLines: 1,
                maxLines: 3,
                controller: noteController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.edit),
                  icon: Icon(Icons.note),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
        TextButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              widget.editNote(widget.todo, noteController.text);
              widget.editTitle(widget.todo, titleController.text);
              widget.editTime(widget.todo, todoTime);
              AutoRouter.of(context).pop();
            }
          },
          child: Text("Confirm"),
        ),
      ],
    );
  }
}
