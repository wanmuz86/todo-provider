import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  // 1 Create a variable to store the data that's going to be passed by parent
  final Map<String,dynamic> item;

  // 2 Create constructor for this page
 DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
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
                  child: Text(item["name"]!, style: TextStyle(fontSize: 32, color: Colors.red),),
                )),
            SizedBox(height: 8,),
            Text(item["desc"]!),
            SizedBox(height: 8,),
            Text(item["place"]!)
          ],
        ),
      ),
    );
  }
}
