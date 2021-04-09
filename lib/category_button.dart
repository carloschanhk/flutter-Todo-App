import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  CategoryButton({this.categories});
  List categories;
  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  String dropdownValue = "Work";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
        labelText: 'Select Category',
        hintText: "Category",
      ),
        value: dropdownValue,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: List<String>.generate(
                7, (i) => widget.categories[i + 1]["category"])
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}
