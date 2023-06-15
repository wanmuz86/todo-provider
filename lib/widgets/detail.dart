import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {

  // 1 Create a variable to store the data that's going to be passed by parent
  final Todo item;

  // 2 Create constructor for this page
 DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<TodoProvider>(context);
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text("Detail"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.name, style: TextStyle(fontSize: 32, color: Colors.red),),
                )),
            SizedBox(height: 8,),
            Text(item.description ?? ""),
            SizedBox(height: 8,),
            Text(item.place ?? ""),
            !providers.urgentTodos.contains(item) ?
            TextButton.icon(onPressed: (){
              providers.addUrgentTodo(item);
            },
                icon: Icon(Icons.warning_amber),
                label: Text("Marked as urgent"))
                :
            TextButton.icon(onPressed: (){
              providers.removeUrgentTodo(item);
            },
                icon: Icon(Icons.warning_amber),
                label: Text("Remove from urgent"))
          ],
        ),
      ),
    );
  }
}
