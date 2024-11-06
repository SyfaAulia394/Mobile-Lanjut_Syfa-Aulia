import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/anggota.dart';

class AnggotaListScreen extends StatelessWidget {
  final DatabaseHelper db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Anggota')),
      body: FutureBuilder<List<Anggota>>(
        future: db.fetchAnggota(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final anggotaList = snapshot.data!;
          return ListView.builder(
            itemCount: anggotaList.length,
            itemBuilder: (context, index) {
              final anggota = anggotaList[index];
              return ListTile(
                title: Text(anggota.namaAnggota),
                subtitle: Text(anggota.alamat),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke layar tambah anggota
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
