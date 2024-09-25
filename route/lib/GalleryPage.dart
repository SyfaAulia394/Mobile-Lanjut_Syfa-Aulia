import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Gallery Page",
              style: TextStyle(fontSize: 24), // Menambahkan style untuk teks
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Kembali ke halaman sebelumnya
                  },
                  child: Text("<< Back"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        '/homepage'); // Navigasi ke halaman dengan rute nama
                  },
                  child: Text("Next >>"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}