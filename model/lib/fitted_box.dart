import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitted Box"),
        ), // AppBar

        body: Center(
          child: Container(
            color: Colors.blue,
            // width: 300,  // Jika perlu, bisa dibuka
            // height: 110, // Jika perlu, bisa dibuka

            child: FittedBox(
              alignment: Alignment.centerRight,
              child: Image.network("https://picsum.photos/500/500"), // Perbaikan URL gambar
            ), // FittedBox
          ), // Container
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}
