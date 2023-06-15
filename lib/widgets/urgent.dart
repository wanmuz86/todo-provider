import 'package:flutter/material.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';
class UrgentPage extends StatelessWidget {
  const UrgentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var urgents = context.watch<TodoProvider>().urgentTodos;
    var providers = Provider.of<TodoProvider>(context);
    return Scaffold(appBar: AppBar(title: Text("Urgent"),),
    body: ListView.builder(
        itemCount: urgents.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(urgents[index].name),
            subtitle: Text(urgents[index].place ?? ""),
            trailing: TextButton(onPressed: (){
              providers.removeUrgentTodo(urgents[index]);
            } ,child: Text("Remove"),
            ),
          );
        })
    );
  }
}
