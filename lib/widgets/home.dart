import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add.dart';
import 'package:todo_app/widgets/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var items = [
    // {
    //   "name":"Learn Listview",
    //   "place":"Zoom",
    //   "desc":"ListView,ListTIle, Builder etc"
    // },
    // {
    //   "name":"Prepare Dinner",
    //   "place":"Home",
    //   "desc":"Nasi Goreng"
    // },
    // {
    //   "name":"Do Laundry",
    //   "place":"Laundrmart",
    //   "desc":"xxxxxx"
    // }
  ];

  @override
  void initState() {
    // I want to do something when the page is loaded
    super.initState();
    loadData();
  }
  // Do chapter 2 of the book if you want to learn about function declaration
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var itemString = prefs.getString("todos");
    if (itemString != null){
      setState(() {
        // jsonDecode is to transform String into List of Map
        items= jsonDecode(itemString);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("To Do"),
        actions: [

        IconButton(onPressed: () async {
          // async await is used to turn an asynchronous function to be synchronous
          var newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPage()),
          );
          // Update the UI
// get the shared preference instance ()
          final SharedPreferences prefs = await SharedPreferences.getInstance();

          // save!!!!!! (String, int, double, boolean, List of String) -> Supported by shared preference
          // We have array of Map ..
          // Transform our list of Map into String and save as String (jsonEncode)
          items.add(newItem);
          // import 'dart:convert';
          prefs.setString("todos", jsonEncode(items));

          setState(() {
            // add the new item/receive inside the List
            items;
          });

        }, icon: Icon(Icons.add))

      ],),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          // How many rows are there = the numnber of items in our data source [items list]
          itemCount: items.length,
          // What to show in every row => Container -> Center -> Text
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              tileColor: colors[index % 3]  ,
              title: Text(items[index]["name"]!,),
              subtitle: Text(items[index]["place"]!),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.push(context,
                // 3) Pass the item via the constructor/ DetailPge
                MaterialPageRoute(builder: (context)=>DetailPage(item:items[index])));
              },
            );
          }
      ),
    );
  }
}
