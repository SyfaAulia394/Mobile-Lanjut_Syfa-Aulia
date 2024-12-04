import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Menu"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Menu Pilihan",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PageSatu()),
                );
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PageAnggota()),
                );
              },
              leading: Icon(Icons.group),
              title: Text("Anggota"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PageBuku()),
                );
              },
              leading: Icon(Icons.book),
              title: Text("Buku"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PagePeminjaman()),
                );
              },
              leading: Icon(Icons.library_books),
              title: Text("Peminjaman"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Ini adalah halaman utama."),
      ),
    );
  }
}

class PageSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Satu"),
      ),
      body: Center(
        child: Text("Ini adalah halaman pertama."),
      ),
    );
  }
}

class PageAnggota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Anggota"),
      ),
      body: Center(
        child: Text("Ini adalah halaman untuk Anggota."),
      ),
    );
  }
}

class PageBuku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Buku"),
      ),
      body: Center(
        child: Text("Ini adalah halaman untuk Buku."),
      ),
    );
  }
}

class PagePeminjaman extends StatelessWidget {
  final List<Map<String, String>> peminjamanData = [
    {
      'id': '1',
      'kode_anggota': 'A001',
      'tgl_pinjam': '2024-12-01',
      'tgl_kembali': '2024-12-15',
      'kode_buku': 'B001',
    },
    {
      'id': '2',
      'kode_anggota': 'A002',
      'tgl_pinjam': '2024-12-05',
      'tgl_kembali': '2024-12-20',
      'kode_buku': 'B002',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Peminjaman"),
      ),
      body: ListView.builder(
        itemCount: peminjamanData.length,
        itemBuilder: (context, index) {
          final peminjaman = peminjamanData[index];
          return ListTile(
            title: Text("Kode Anggota: ${peminjaman['kode_anggota']}"),
            subtitle: Text("Kode Buku: ${peminjaman['kode_buku']}"),
            trailing: Text("Tgl Pinjam: ${peminjaman['tgl_pinjam']}"),
            onTap: () {
              // Navigate to detail page (You can create a new page for details)
              // For now, we'll just display a simple dialog with the peminjaman info
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Detail Peminjaman"),
                  content: Text(
                    'ID: ${peminjaman['id']}\n'
                    'Kode Anggota: ${peminjaman['kode_anggota']}\n'
                    'Tanggal Pinjam: ${peminjaman['tgl_pinjam']}\n'
                    'Tanggal Kembali: ${peminjaman['tgl_kembali']}\n'
                    'Kode Buku: ${peminjaman['kode_buku']}',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
