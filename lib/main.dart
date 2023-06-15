import 'package:flutter/material.dart';
import 'widgets/home.dart';
import 'providers/todo_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
      ChangeNotifierProvider<TodoProvider>(

    create: (_) => TodoProvider(),
    child: const MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
