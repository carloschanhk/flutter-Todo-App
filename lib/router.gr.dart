// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:tutorial_1/home_page.dart' as _i2;
import 'package:tutorial_1/new_task_page.dart' as _i3;
import 'package:tutorial_1/task_list_page.dart' as _i4;

class FlutterRouter extends _i1.RootStackRouter {
  FlutterRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i2.HomePage());
    },
    NewTaskPageRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<NewTaskPageRouteArgs>(orElse: () => NewTaskPageRouteArgs());
      return _i1.AdaptivePage(
          entry: entry, child: _i3.NewTaskPage(categories: args.categories));
    },
    TaskListPageRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: _i4.TaskListPage());
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

class NewTaskPageRoute extends _i1.PageRouteInfo<NewTaskPageRouteArgs> {
  NewTaskPageRoute({List<dynamic> categories})
      : super(name,
            path: '/new-task-page',
            args: NewTaskPageRouteArgs(categories: categories));

  static const String name = 'NewTaskPageRoute';
}

class NewTaskPageRouteArgs {
  const NewTaskPageRouteArgs({this.categories});

  final List<dynamic> categories;
}

class TaskListPageRoute extends _i1.PageRouteInfo {
  const TaskListPageRoute() : super(name, path: '/task-list-page');

  static const String name = 'TaskListPageRoute';
}
