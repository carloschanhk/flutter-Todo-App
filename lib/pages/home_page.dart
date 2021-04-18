import 'package:flutter/material.dart';
import '../buttons/gridbutton.dart';
import '../router.gr.dart';
import 'package:auto_route/auto_route.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(
            padding: EdgeInsets.only(left: 20),
            child: IconButton(
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
          child: Column(
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
                                index: i,
                              ))))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(NewTaskPageRoute());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
