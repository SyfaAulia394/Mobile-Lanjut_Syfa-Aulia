import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitur TextField"),
        ),
        body: Center(
          child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            autocorrect: false,
            autofocus: false,
            enableSuggestions: true,
            enableInteractiveSelection: false,
            keyboardType: TextInputType.phone,
            readOnly: true,
            style: TextStyle(
        color: Colors.red,
        fontSize: 20
      ),
      decoration: InputDecoration(
        icon: Icon(
          Icons.person,
          size: 35,

        ),
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          Icons.person_add,
          size: 35,
        ),
        hintText: "silahkan input nama",
        labelText: "full nama"
      ),

      ),
      
      
          ),
          ),
        ),
      );
     // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}


  