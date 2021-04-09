import 'package:flutter/material.dart';
import 'category_button.dart';

class NewTaskPage extends StatelessWidget {
  final taskController = new TextEditingController();
  final noteController = new TextEditingController();
  NewTaskPage({this.categories});
  final List categories;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("New Task",style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal:25),
          child:Column(
          children: [
            TextField(
              controller: taskController,
              autofocus: true,
              maxLines: 8,
              decoration: InputDecoration(hintText: "What are you planning?"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical:15),
              child:TextField(
              controller: noteController,
              decoration: InputDecoration(hintText: "Add Notes",icon: Icon(Icons.note),border: InputBorder.none),
            )),
            CategoryButton(categories: categories,),
            ],
        )));
  }
}
