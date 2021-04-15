import 'package:flutter/material.dart';
import 'router.gr.dart';
import 'package:provider/provider.dart';
import 'model/todo_list.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TodoListModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  final _appRouter = FlutterRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
