import 'package:flutter/material.dart';
import '/db/database_helper.dart';
import '/models/buku.dart';
import '/screens/add_buku_screen.dart'; // Pastikan ini ada

class BukuListScreen extends StatelessWidget {
  final DatabaseHelper db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Buku')),
      body: FutureBuilder<List<Buku>>(
        future: db.fetchBuku(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final bukuList = snapshot.data!;
          return ListView.builder(
            itemCount: bukuList.length,
            itemBuilder: (context, index) {
              final buku = bukuList[index];
              return ListTile(
                title: Text(buku.judul),
                subtitle: Text('Pengarang: ${buku.pengarang}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke layar tambah buku
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBukuScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
