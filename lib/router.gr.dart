// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:todo/pages/home_page.dart' as _i2;
import 'package:todo/pages/new_task_page.dart' as _i3;
import 'package:todo/pages/task_list_page.dart' as _i4;

class FlutterRouter extends _i1.RootStackRouter {
  FlutterRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.HomePage());
    },
    NewTaskPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i3.NewTaskPage());
    },
    TaskListPageRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<TaskListPageRouteArgs>(orElse: () => TaskListPageRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i4.TaskListPage(index: args.index));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name, path: '/'),
        _i1.RouteConfig(NewTaskPageRoute.name, path: '/new-task-page'),
        _i1.RouteConfig(TaskListPageRoute.name, path: '/task-list-page')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/');

  static const String name = 'HomePageRoute';
}

class NewTaskPageRoute extends _i1.PageRouteInfo {
  const NewTaskPageRoute() : super(name, path: '/new-task-page');

  static const String name = 'NewTaskPageRoute';
}

class TaskListPageRoute extends _i1.PageRouteInfo<TaskListPageRouteArgs> {
  TaskListPageRoute({int index})
      : super(name,
            path: '/task-list-page', args: TaskListPageRouteArgs(index: index));

  static const String name = 'TaskListPageRoute';
}

class TaskListPageRouteArgs {
  const TaskListPageRouteArgs({this.index});

  final int index;
}
