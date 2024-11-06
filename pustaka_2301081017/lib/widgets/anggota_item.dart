import 'package:flutter/material.dart';
import '../models/anggota.dart';

class AnggotaItem extends StatelessWidget {
  final Anggota anggota;

  AnggotaItem({required this.anggota});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(anggota.namaAnggota),
      subtitle: Text('Alamat: ${anggota.alamat}\nJenis Kelamin: ${anggota.jenisKelamin}'),
    );
  }
}
