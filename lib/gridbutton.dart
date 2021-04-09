import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  GridButton({@required this.icon, this.category, this.tasks});
  final String category;
  final Icon icon;
  final List tasks;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {  },
        child: Column(children: [
          icon, 
          Container(child: Column(children:[Text(category,style:TextStyle(fontSize: 24,color: Colors.black)), Text('${tasks.length} Tasks',style:TextStyle(color: Colors.black))]))],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
        );
  }
}
