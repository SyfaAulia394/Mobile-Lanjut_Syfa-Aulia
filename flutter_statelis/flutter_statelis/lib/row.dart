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
          title: Text("My App"),

        ),
        body: Row(
          children: [
            Container(
              width: 100,
              height: 20,
              color: Colors.green,

            ),
            Container(
              width: 100,
              height: 25,
              color: Colors.yellow,
            ),
             Container(
              width: 100,
              height: 20,
              color: Colors.red,
            ),
             Container(
              width: 100,
              height: 20,
              color: Colors.blue,
            ),
             Container(
              width: 100,
              height: 20,
              color: Colors.pink,
            ),
          ],
        )
        ),);
  }}