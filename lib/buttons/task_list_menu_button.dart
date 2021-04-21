import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import '../router.gr.dart';

class TaskListMenuButton extends StatelessWidget {
  const TaskListMenuButton({Key key, this.changeSelectMode}) : super(key: key);
  final changeSelectMode;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: SvgPicture.asset(
        "assets/icons/more_vert_white_24dp.svg",
        semanticsLabel: "Menu Button",
      ),
      offset: Offset(0, 20),
      onSelected: (value) {
        switch (value) {
          case 1:
            context.router.push(NewTaskPageRoute());
            break;
          case 2:
            changeSelectMode();
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        List<PopupMenuEntry<dynamic>> list = [];
        list.add(
          PopupMenuItem(
            value: 1,
            child: Container(
              child: Text(
                "New Project",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        );
        list.add(
          PopupMenuDivider(
            height: 10,
          ),
        );
        list.add(
          PopupMenuItem(
            value: 2,
            child: Text(
              "Select",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        );
        return list;
      },
    );
  }
}
