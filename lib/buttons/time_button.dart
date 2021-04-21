import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TimeButton extends StatelessWidget {
  TimeButton({this.setTime, this.todoTime});
  final Function setTime;
  final DateTime todoTime;

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat("EEE MMM dd, kk:mm").format(todoTime);
    return Row(
      children: [
        Icon(Icons.alarm, color: Colors.black54),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 9),
          child: TextButton(
            onPressed: () {
              DatePicker.showDateTimePicker(
                context,
                showTitleActions: true,
                currentTime: todoTime,
                onConfirm: (date) {
                  setTime(date);
                },
              );
            },
            child: Text("$formattedTime"),
          ),
        ),
      ],
    );
  }
}
