import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/anggota.dart';

class AddAnggotaScreen extends StatefulWidget {
  @override
  _AddAnggotaScreenState createState() => _AddAnggotaScreenState();
}

class _AddAnggotaScreenState extends State<AddAnggotaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _kodeAnggotaController = TextEditingController();
  final _namaAnggotaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _jenisKelaminController = TextEditingController();
  final _peminjamanController = TextEditingController();
  final _pengembalianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Anggota')),
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
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              // Tambahkan field lainnya sesuai kebutuhan
              ElevatedButton(
                onPressed: () async {
                  final anggota = Anggota(
                    kodeAnggota: _kodeAnggotaController.text,
                    namaAnggota: _namaAnggotaController.text,
                    alamat: _alamatController.text,
                    jenisKelamin: _jenisKelaminController.text,
                    peminjaman: _peminjamanController.text,
                    pengembalian: _pengembalianController.text,
                  );
                  await DatabaseHelper.instance.insertAnggota(anggota);
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
