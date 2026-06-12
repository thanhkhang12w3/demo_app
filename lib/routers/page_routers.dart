import 'package:demo_app/Screen/add_task.dart';
import 'package:demo_app/Screen/homeTask.dart';
import 'package:demo_app/Screen/login.dart';
import 'package:demo_app/routers/route_names.dart';

final pageRoute = {
  RouteNames().home: (context) => Hometask(),
  RouteNames().login: (context) => Login(),
  RouteNames().addtask: (context) => AddTask(),
};
