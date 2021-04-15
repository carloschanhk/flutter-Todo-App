import 'package:flutter/material.dart';

class EditDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Todo"),
      content: Form(
          key: _formKey,
          child: Stack(children: [
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your task!";
                } else {
                  return null;
                }
              },
              controller: new TextEditingController(),
              maxLines: 2,
              decoration: InputDecoration(hintText: "What are you planning?"),
            ),
          ])),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"))
      ],
    );
  }
}
