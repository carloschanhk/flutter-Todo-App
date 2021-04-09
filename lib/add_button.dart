import 'package:flutter/material.dart';
import 'new_task_page.dart';

class AddButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewTaskPage()));
      },
      child: Icon(Icons.add),
    );
  }
}
