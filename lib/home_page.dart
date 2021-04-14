import 'package:flutter/material.dart';
import 'Todo.dart';
import 'gridbutton.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'new_task_page.dart';
import 'router.gr.dart';
import 'package:auto_route/auto_route.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List categories = [
    {"category": "All", "icon": Icons.assignment, "tasks": all},
    {"category": "Work", "icon": Icons.work, "tasks": work},
    {"category": "Health", "icon": Icons.favorite, "tasks": health},
    {
      "category": "Exercise",
      "icon": FlutterIcons.running_faw5s,
      "tasks": exercise
    },
    {"category": "Home", "icon": Icons.home, "tasks": home},
    {"category": "Travel", "icon": FlutterIcons.plane_faw, "tasks": travel},
    {"category": "Shopping", "icon": Icons.shopping_cart, "tasks": shopping},
    {"category": "Leisure", "icon": Icons.park, "tasks": leisure},
  ];
  static List work = [];
  static List health = [];
  static List exercise = [];
  static List home = [];
  static List travel = [];
  static List shopping = [];
  static List leisure = [];
  static List all = [];

  _addTask(Todo todo) {
    if (todo != null) {
      switch (todo.category) {
        case "Work":
          setState(() {
            work.add(todo);
          });
          break;
        case "Health":
          setState(() {
            health.add(todo);
          });
          break;
        case "Exercise":
        print("add exercise");
          setState(() {
            exercise.add(todo);
          });
          break;
        case "Home":
        print("add home");
          setState(() {
            home.add(todo);
          });
          break;
        case "Travel":
          setState(() {
            travel.add(todo);
          });
          break;
        case "Shopping":
          setState(() {
            shopping.add(todo);
          });
          break;
        case "Leisure":
          setState(() {
            leisure.add(todo);
          });
          break;
      }
      setState(() {
        all.add(todo);
      });
    }
  }
  removeTask(todo, index){
    switch (todo.category) {
        case "Work":
          setState(() {
            work.removeWhere((element) => element == todo);
          });
          break;
        case "Health":
          setState(() {
            health.removeWhere((element) => element == todo);
          });
          break;
        case "Exercise":
        print("remove exercise");
          setState(() {
            exercise.removeWhere((element) => element == todo);
          });
          break;
        case "Home":
          print("remove home");
          setState(() {
            home.removeWhere((element) => element == todo);
          });
          break;
        case "Travel":
          setState(() {
            travel.removeWhere((element) => element == todo);
          });
          break;
        case "Shopping":
          setState(() {
            shopping.removeWhere((element) => element == todo);
          });
          break;
        case "Leisure":
          setState(() {
            leisure.removeWhere((element) => element == todo);
          });
          break;
      }
      setState(() {
        print("remove all");
        all.removeWhere((element) => element == todo);
      });
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left:20),
          child:IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Text("Category",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )))
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child:Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Text("Lists",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ))),
          Expanded(
              child: GridView.count(
                  padding: EdgeInsets.all(30),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  children: List.generate(
                      8,
                      (i) => GridButton(
                            icon: categories[i]["icon"],
                            category: categories[i]["category"],
                            tasks: categories[i]["tasks"],
                            removeTask:removeTask,
                            parentContext: context,
                          ))))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(NewTaskPageRoute(
            categories: categories,
            addTask: _addTask,
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
