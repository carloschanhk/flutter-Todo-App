import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({this.categories,this.selectCategory});
  List categories;
  Function selectCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField(
        hint: Text("Category"),
        validator: (String value) {
                      if (value==null) {
                        return 'Please select a category';
                      }
                    },
        onChanged: (String newValue) {
          selectCategory(newValue);
        },
        items: List<String>.generate(
                7, (i) => categories[i + 1]["category"])
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }
}
