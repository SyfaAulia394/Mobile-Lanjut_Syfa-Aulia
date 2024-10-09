import 'package:flutter/material.dart';
import 'result_page.dart';
import 'package:intl/intl.dart'; // Untuk format waktu

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _kodePelangganController = TextEditingController();
  final TextEditingController _namaPelangganController = TextEditingController();
  final TextEditingController _jamMasukController = TextEditingController();
  final TextEditingController _jamKeluarController = TextEditingController();
  String? _jenisPelanggan;
  final double tarifPerJam = 10000;

  // Fungsi untuk mengonversi string ke TimeOfDay
  TimeOfDay? _parseTime(String value) {
    try {
      final format = DateFormat.Hm(); // Format HH:mm
      final parsed = format.parse(value);
      return TimeOfDay(hour: parsed.hour, minute: parsed.minute);
    } catch (e) {
      return null;
    }
  }

  // Validator untuk format waktu
  String? _validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan waktu (HH:mm)';
    }
    final time = _parseTime(value);
    if (time == null) {
      return 'Format waktu tidak valid (contoh: 14:30)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Entri Pelanggan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodePelangganController,
                decoration: InputDecoration(labelText: 'Kode Pelanggan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Kode Pelanggan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaPelangganController,
                decoration: InputDecoration(labelText: 'Nama Pelanggan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan Nama Pelanggan';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _jenisPelanggan,
                decoration: InputDecoration(labelText: 'Jenis Pelanggan'),
                items: ['VIP', 'GOLD', 'REGULAR'].map((String jenis) {
                  return DropdownMenuItem<String>(
                    value: jenis,
                    child: Text(jenis),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _jenisPelanggan = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Pilih Jenis Pelanggan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jamMasukController,
                decoration: InputDecoration(labelText: 'Jam Masuk (HH:mm)'),
                keyboardType: TextInputType.datetime,
                validator: _validateTime,
              ),
              TextFormField(
                controller: _jamKeluarController,
                decoration: InputDecoration(labelText: 'Jam Keluar (HH:mm)'),
                keyboardType: TextInputType.datetime,
                validator: _validateTime,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final jamMasuk = _parseTime(_jamMasukController.text)!;
                    final jamKeluar = _parseTime(_jamKeluarController.text)!;
                    double lama = (jamKeluar.hour - jamMasuk.hour).toDouble();
                    double totalBayar = lama * tarifPerJam;

                    if (_jenisPelanggan == "VIP" && lama > 2) {
                      totalBayar -= totalBayar * 0.02;
                    } else if (_jenisPelanggan == "GOLD" && lama > 2) {
                      totalBayar -= totalBayar * 0.05;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          kodePelanggan: _kodePelangganController.text,
                          namaPelanggan: _namaPelangganController.text,
                          jenisPelanggan: _jenisPelanggan!,
                          totalBayar: totalBayar,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Hitung Total Bayar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
