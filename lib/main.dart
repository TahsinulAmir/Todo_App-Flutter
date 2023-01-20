import 'package:flutter/material.dart';
import 'package:todo_app/screen/add_todo.dart';
import 'package:todo_app/screen/homepage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      routes: {
        'homepage': (context) => Homepage(),
        'add_todo': (context) => AddTodo(),
      },
      initialRoute: 'homepage',
    );
  }
}
