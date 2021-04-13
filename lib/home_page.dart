import 'package:flutter/material.dart';
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
    {
      "category": "All",
      "icon": Icon(Icons.assignment, color: Colors.blue, size: 40),
      "tasks": all
    },
    {
      "category": "Work",
      "icon": Icon(Icons.work, color: Colors.brown, size: 40),
      "tasks": work
    },
    {
      "category": "Health",
      "icon": Icon(Icons.favorite, color: Colors.pink, size: 40),
      "tasks": health
    },
    {
      "category": "Exercise",
      "icon": Icon(FlutterIcons.running_faw5s, size: 40),
      "tasks": exercise
    },
    {"category": "Home", "icon": Icon(Icons.home, size: 40), "tasks": home},
    {
      "category": "Travel",
      "icon": Icon(FlutterIcons.plane_faw, size: 40),
      "tasks": travel
    },
    {
      "category": "Shopping",
      "icon": Icon(Icons.shopping_cart, size: 40),
      "tasks": shopping
    },
    {
      "category": "Leisure",
      "icon": Icon(Icons.park, size: 40),
      "tasks": leisure
    },
  ];
  static List work = [];
  static List health = [];
  static List exercise = [];
  static List home = [];
  static List travel = ["Japan"];
  static List shopping = ["Apple"];
  static List leisure = [];
  static List all = [
    ...work,
    ...health,
    ...exercise,
    ...home,
    ...travel,
    ...shopping,
    ...leisure
  ];

  _addTask() async{
    final task = await NewTaskPage(categories: categories,);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                          ))))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(NewTaskPageRoute(
            categories: categories
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
