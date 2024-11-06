import 'package:flutter/material.dart';
import 'screens/anggota_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Perpustakaan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnggotaListScreen(),
    );
  }
}