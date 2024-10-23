import 'dart:convert'; // Perbaikan pada penulisan import
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  void connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id); // Perbaikan penulisan URI

    var hasilResponse = await http.get(url); // Tambah tanda '='

    _data = (json.decode(hasilResponse.body))["data"]; // Ambil data dari hasil response
    notifyListeners(); // Panggil notifyListeners untuk memberi tahu perubahan data
  }
}
