import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  final List<Container> myList = List.generate(
    90,
    (index){
      return Container(
        color: Color.fromARGB(255, Random().nextInt(256),Random().nextInt(256),
        Random().nextInt(256),),
      );
    },
  
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Gridview"),
        ),
        body: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3,
            mainAxisSpacing: 10,
             childAspectRatio: 3/4
            ),
          
        children: myList,
       )),
       
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}
