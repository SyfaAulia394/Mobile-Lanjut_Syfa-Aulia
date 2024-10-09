import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String kodePelanggan;
  final String namaPelanggan;
  final String jenisPelanggan;
  final double totalBayar;

  ResultPage({
    required this.kodePelanggan,
    required this.namaPelanggan,
    required this.jenisPelanggan,
    required this.totalBayar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Perhitungan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kode Pelanggan: $kodePelanggan'),
            Text('Nama Pelanggan: $namaPelanggan'),
            Text('Jenis Pelanggan: $jenisPelanggan'),
            Text('Total Bayar: Rp${totalBayar.toStringAsFixed(0)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
