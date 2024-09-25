import 'package:flutter/material.dart';
import 'package:navigasi/PageSatu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageSatu(),
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}
