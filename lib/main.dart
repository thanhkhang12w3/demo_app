import 'package:demo_app/Screen/homeTask.dart';
import 'package:demo_app/routers/page_routers.dart';
import 'package:demo_app/routers/route_names.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routNames = RouteNames();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: pageRoute,
      home: Hometask(),
    );
  }
}
