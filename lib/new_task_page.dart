import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'Todo.dart';
import 'category_button.dart';
import 'time_button.dart';
import 'package:intl/intl.dart';

class NewTaskPage extends StatefulWidget {
  NewTaskPage({this.categories, this.addTask});
  final List categories;
  final Function addTask;
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final taskController = new TextEditingController();
  final noteController = new TextEditingController();
  static DateTime todoTime = DateTime.now();
  String formattedDate = DateFormat("EEE MMM dd, kk:mm").format(todoTime);
  String category;
  selectCategory(newValue) {
    setState(() {
      category = newValue;
    });
  }

  setTime(newTime) {
    setState(() {
      todoTime = newTime;
      formattedDate = DateFormat("EEE MMM dd, kk:mm").format(todoTime);
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("New Task", style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                                    if (value.isEmpty){
                                      return "Please enter your task!";
                                    } else {
                                      return null;
                                    }
                                  },
                          controller: taskController,
                          maxLines: 8,
                          decoration: InputDecoration(
                              hintText: "What are you planning?"),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                TimeButton(
                                  setTime: setTime,
                                  formattedDate: formattedDate,
                                ),
                                TextField(
                                  controller: noteController,
                                  decoration: InputDecoration(
                                      hintText: "Add Notes",
                                      icon: Icon(Icons.note),
                                      border: InputBorder.none),
                                ),
                                CategoryButton(
                                  categories: widget.categories,
                                  selectCategory: selectCategory,
                                ),
                              ],
                            )),
                      ],
                    )),
                Spacer(),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ))),
                      child: Text(
                        "Create",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                        final todo = new Todo(
                            title: taskController.text,
                            note: noteController.text,
                            todoTime: todoTime,
                            category: category);
                        widget.addTask.call(todo);
                        AutoRouter.of(context).pop();
                      }},
                    ),
                  )
                ])
              ],
            )));
  }
}
