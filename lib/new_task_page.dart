import 'package:flutter/material.dart';
import 'category_button.dart';
import 'time_button.dart';
import 'package:intl/intl.dart';

class NewTaskPage extends StatefulWidget {
  NewTaskPage({this.categories});
  final List categories;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("New Task", style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TextField(
                      controller: taskController,
                      maxLines: 8,
                      decoration:
                          InputDecoration(hintText: "What are you planning?"),
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
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ))),
                  child: Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print(category);
                    print(taskController.text);
                    print(noteController.text);
                    print(todoTime);
                    
                  },
                ),
              )
            ])
          ],
        ));
  }
}
