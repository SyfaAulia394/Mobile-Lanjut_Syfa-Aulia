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
        body: Stack(
          children: [
            Container(
              width: 400,
              height: 200,
              color: Colors.green,

            ),
            Container(
              width: 300,
              height: 150,
              color: Colors.yellow,
            ),
             Container(
              width: 200,
              height: 100,
              color: Colors.red,
            ),
             Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
            
          ],
        )
        ),);
  }}