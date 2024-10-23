import 'package:flutter/material.dart';
import 'package:model/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
  }

