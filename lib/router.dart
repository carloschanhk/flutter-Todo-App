import 'package:auto_route/annotations.dart';
import 'home_page.dart';
import 'new_task_page.dart';
import 'task_list_page.dart';


@AdaptiveAutoRouter(routes:[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: NewTaskPage),
  AutoRoute(page: TaskListPage)
])
class $FlutterRouter{}