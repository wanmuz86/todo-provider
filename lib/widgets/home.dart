import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/add.dart';
import 'package:todo_app/widgets/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/urgent.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    var todos = context.watch<TodoProvider>().todos;
    var urgents = context.watch<TodoProvider>().urgentTodos;
    return  Scaffold(
      appBar: AppBar(title: Text("To Do"),
        actions: [

        IconButton(onPressed: ()  {
          // async await is used to turn an asynchronous function to be synchronous
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPage()),
          );


        }, icon: Icon(Icons.add))

      ],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> UrgentPage()));

          }, child: Text("Urgent (${urgents.length})",
      style: const TextStyle(fontSize: 24),
    ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 20)),
    ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                // How many rows are there = the numnber of items in our data source [items list]
                itemCount: todos.length,
                // What to show in every row => Container -> Center -> Text
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: colors[index % 3]  ,
                    title: Text(todos[index].name,),
                    subtitle: Text(todos[index].name),
                    trailing: Icon(Icons.chevron_right),
                    onTap: (){
                      Navigator.push(context,
                      // 3) Pass the item via the constructor/ DetailPge
                      MaterialPageRoute(builder: (context)=>DetailPage(item:todos[index])));
                    },
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
