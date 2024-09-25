import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Kalkulator(),
    );
  }
}

class Kalkulator extends StatefulWidget {
  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  double num1 = 0;
  double num2 = 0;
  double hasil = 0;
  String operasi = '';

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  void hitung(String operator) {
    setState(() {
      num1 = double.parse(num1Controller.text);
      num2 = double.parse(num2Controller.text);

      switch (operator) {
        case '+':
          hasil = num1 + num2;
          break;
        case '-':
          hasil = num1 - num2;
          break;
        case '*':
          hasil = num1 * num2;
          break;
        case '/':
          hasil = num2 != 0 ? num1 / num2 : 0; // Hindari pembagian dengan 0
          break;
      }
      operasi = operator;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka Pertama',
              ),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka Kedua',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => hitung('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => hitung('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => hitung('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => hitung('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Hasil: $num1 $operasi $num2 = $hasil',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
