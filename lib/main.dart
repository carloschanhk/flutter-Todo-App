import 'package:flutter/material.dart';
import 'router.gr.dart';

void main() {
  runApp(MyApp());
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
