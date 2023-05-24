import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("To Do"),
        actions: [
        IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPage()),
          );
        }, icon: Icon(Icons.add))

      ],),
      body: Text("Home Page"),
    );
  }
}
