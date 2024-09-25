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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tumpukan"),

        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.green,

            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.yellow,
            ),
             Container(
              width: 300,
              height: 300,
              color: Colors.red,
            ),
             Container(
              width: 300,
              height: 300,
              color: Colors.blue,
            ),
            
          ],
        )
        ),);
  }}