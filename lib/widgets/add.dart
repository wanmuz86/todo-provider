import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1) Create TextEditingController to link it to the TextField
    var nameEditingController = TextEditingController();
    var descEditingController = TextEditingController();
    var placeEditingController = TextEditingController();
    final providers = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Add page"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            // 2) Link the TextEditingController to the TextField
           TextField(decoration: InputDecoration(hintText: "Enter item name"),
             controller: nameEditingController,),
            SizedBox(height: 10,),
            TextField(decoration: InputDecoration(hintText: "Enter item description"),
              controller: descEditingController,),
            SizedBox(height: 10,),
            TextField(decoration: InputDecoration(hintText: "Enter item place"),
              controller: placeEditingController,),
            SizedBox(height: 10,),
            TextButton(onPressed: (){

//3 ) use the .text property to retrieve the value of the TextField
              print(nameEditingController.text);
              print(descEditingController.text);
              print(placeEditingController.text);

              providers.addTodo(nameEditingController.text, placeEditingController.text, descEditingController.text);
              Navigator.pop(context);

            }, child: Text("Add new Item"))
          ],
        ),
      ),
    );
  }
}
