// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i5;
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
          entry: entry,
          child: _i3.NewTaskPage(
              categories: args.categories, addTask: args.addTask));
    },
    TaskListPageRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<TaskListPageRouteArgs>(orElse: () => TaskListPageRouteArgs());
      return _i1.AdaptivePage(
          entry: entry,
          child: _i4.TaskListPage(
              icon: args.icon,
              category: args.category,
              tasks: args.tasks,
              removeTask: args.removeTask));
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
  NewTaskPageRoute({List<dynamic> categories, Function addTask})
      : super(name,
            path: '/new-task-page',
            args:
                NewTaskPageRouteArgs(categories: categories, addTask: addTask));

  static const String name = 'NewTaskPageRoute';
}

class NewTaskPageRouteArgs {
  const NewTaskPageRouteArgs({this.categories, this.addTask});

  final List<dynamic> categories;

  final Function addTask;
}

class TaskListPageRoute extends _i1.PageRouteInfo<TaskListPageRouteArgs> {
  TaskListPageRoute(
      {_i5.IconData icon,
      String category,
      List<dynamic> tasks,
      Function removeTask})
      : super(name,
            path: '/task-list-page',
            args: TaskListPageRouteArgs(
                icon: icon,
                category: category,
                tasks: tasks,
                removeTask: removeTask));

  static const String name = 'TaskListPageRoute';
}

class TaskListPageRouteArgs {
  const TaskListPageRouteArgs(
      {this.icon, this.category, this.tasks, this.removeTask});

  final _i5.IconData icon;

  final String category;

  final List<dynamic> tasks;

  final Function removeTask;
}
