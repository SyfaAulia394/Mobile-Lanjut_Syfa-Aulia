import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/buku.dart';

class AddBukuScreen extends StatefulWidget {
  @override
  _AddBukuScreenState createState() => _AddBukuScreenState();
}

class _AddBukuScreenState extends State<AddBukuScreen> {
  final _formKey = GlobalKey<FormState>();
  final _kodeAnggotaController = TextEditingController();
  final _namaAnggotaController = TextEditingController();
  final _judulController = TextEditingController();
  final _pengarangController = TextEditingController();
  final _penerbitController = TextEditingController();
  final _tahunTerbitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Buku')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeAnggotaController,
                decoration: InputDecoration(labelText: 'Kode Anggota'),
              ),
              TextFormField(
                controller: _namaAnggotaController,
                decoration: InputDecoration(labelText: 'Nama Anggota'),
              ),
              TextFormField(
                controller: _judulController,
                decoration: InputDecoration(labelText: 'Judul'),
              ),
              TextFormField(
                controller: _pengarangController,
                decoration: InputDecoration(labelText: 'Pengarang'),
              ),
              TextFormField(
                controller: _penerbitController,
                decoration: InputDecoration(labelText: 'Penerbit'),
              ),
              TextFormField(
                controller: _tahunTerbitController,
                decoration: InputDecoration(labelText: 'Tahun Terbit'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () async {
                  final buku = Buku(
                    kodeAnggota: _kodeAnggotaController.text,
                    namaAnggota: _namaAnggotaController.text,
                    judul: _judulController.text,
                    pengarang: _pengarangController.text,
                    penerbit: _penerbitController.text,
                    tahunTerbit: int.tryParse(_tahunTerbitController.text) ?? 0,
                  );
                  await DatabaseHelper.instance.insertBuku(buku);
                  Navigator.pop(context);
                },
                child: Text('Tambah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
