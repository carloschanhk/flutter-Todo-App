import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../model/todo_list.dart';
import '../model/Todo.dart';
import '../buttons/category_button.dart';
import '../buttons/time_button.dart';
import 'package:provider/provider.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final taskController = new TextEditingController();
  final noteController = new TextEditingController();
  static DateTime todoTime = DateTime.now();
  String category;
  selectCategory(newValue) {
    setState(() {
      category = newValue;
    });
  }

  setTime(newTime) {
    setState(() {
      todoTime = newTime;
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
          child: Stack(children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ListView(children: [
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter your task!";
                          } else {
                            return null;
                          }
                        },
                        controller: taskController,
                        maxLines: 4,
                        decoration:
                            InputDecoration(hintText: "What are you planning?"),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 5),
                      child: TimeButton(
                        setTime: setTime,
                        todoTime: todoTime,
                      )),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: TextField(
                      controller: noteController,
                      decoration: InputDecoration(
                          hintText: "Add Notes",
                          icon: Icon(Icons.note),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    child: CategoryButton(
                      selectCategory: selectCategory,
                    ),
                  ),
                ])),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                      child: Container(
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ))),
                            child: Text(
                              "Create",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                final todo = new Todo(
                                    title: taskController.text,
                                    note: noteController.text,
                                    todoTime: todoTime,
                                    category: category);
                                context.read<TodoListModel>().addTask(todo);
                                AutoRouter.of(context).pop();
                              }
                            },
                          )))
                ])),
          ]),
        ));
  }
}
