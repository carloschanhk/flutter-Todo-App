import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TimeButton extends StatelessWidget {
  TimeButton({this.setTime,this.formattedDate});
  Function setTime;
  String formattedDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.alarm, color: Colors.black54),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 9),
          child: TextButton(
              onPressed: () {
                DatePicker.showDateTimePicker(context, showTitleActions: true,
                    onConfirm: (date) {
                      setTime(date);
                },);
              },
              child: Text("$formattedDate")),
        )
      ],
    );
  }
}