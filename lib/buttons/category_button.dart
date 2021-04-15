import 'package:flutter/material.dart';
import '../model/todo_list.dart';
import 'package:provider/provider.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({this.selectCategory});
  Function selectCategory;
  @override
  Widget build(BuildContext context) {
    List categoryList = context.read<TodoListModel>().categories;

    return Container(
      child: DropdownButtonFormField(
        hint: Text("Category"),
        validator: (String value) {
                      if (value==null) {
                        return 'Please select a category';
                      } else {
                        return null;
                      }
                    },
        onChanged: (String newValue) {
          selectCategory(newValue);
        },
        items: List<String>.generate(
                7, (i) => categoryList[i + 1]["category"])
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}
