import 'package:flutter/material.dart';
import 'package:flutter_http_get/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil dataProvider dengan listen: true agar widget ini update saat data berubah
    final dataProvider = Provider.of<HttpProvider>(context); 

    // Memanggil API jika data belum diambil
    if (dataProvider.jumlahData == 0) {
      dataProvider.connectAPI("1"); // Mengambil data pengguna dengan ID 1 (atau sesuai ID yang Anda inginkan)
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("GET - PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Consumer<HttpProvider>(
                  builder: (context, value, child) => Image.network(
                    (value.data["avatar"] == null)
                        ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image.png"
                        : value.data["avatar"],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error); // Tampilkan ikon jika gagal memuat gambar
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data["id"] == null)
                      ? "ID: Belum ada data"
                      : "ID: ${value.data["id"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text("Name:", style: TextStyle(fontSize: 20)),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data["first_name"] == null || value.data["last_name"] == null)
                      ? "Belum ada data"
                      : "${value.data["first_name"]} ${value.data["last_name"]}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text("Email:", style: TextStyle(fontSize: 20)),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  (value.data["email"] == null) ? "Belum ada data" : value.data["email"],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
