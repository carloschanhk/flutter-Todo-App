import 'package:auto_route/annotations.dart';
import 'pages/home_page.dart';
import 'pages/new_task_page.dart';
import 'pages/task_list_page.dart';


@AdaptiveAutoRouter(routes:[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: NewTaskPage),
  AutoRoute(page: TaskListPage)
])
class $FlutterRouter{}