import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustaka1_2301081016/pages/detail_peminjaman_page.dart';
import 'package:pustaka1_2301081016/pages/home_peminjaman.dart';

import 'pages/home_anggota.dart';
import 'pages/add_anggota_page.dart';
import 'pages/detail_anggota_page.dart';

import 'pages/home_buku.dart';
import 'pages/add_buku_page.dart';
import 'pages/detail_buku_page.dart';

import 'pages/home_pengembalian.dart';
import 'pages/add_pengembalian_page.dart';
import 'pages/detail_pengembalian_page.dart';

import 'pages/add_peminjaman_page.dart';

import 'providers/anggotas.dart';
import 'providers/bukus.dart';
import 'providers/peminjamans.dart';
import 'providers/pengembalians.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Anggotas()),
        ChangeNotifierProvider(create: (context) => Bukus()),
        ChangeNotifierProvider(create: (context) => Peminjamans()),
        ChangeNotifierProvider(create: (context) => Pengembalians()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          AddAnggota.routeName: (context) => AddAnggota(),
          DetailAnggota.routeName: (context) => DetailAnggota(),
          AddBuku.routeName: (context) => AddBuku(),
          DetailBuku.routeName: (context) => DetailBuku(),
          AddPeminjaman.routeName: (context) => AddPeminjaman(),
          DetailPeminjaman.routeName: (context) => DetailPeminjaman(),
          AddPengembalian.routeName: (context) => AddPengembalian(),
          DetailPengembalian.routeName: (context) => DetailPengembalian(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   // "Pilih Halaman untuk Melihat Data:",
            //   style: TextStyle(fontSize: 18),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageAnggota()),
                );
              },
              child: Text("Anggota"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageBuku()),
                );
              },
              child: Text("Buku"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePagePeminjaman()),
                );
              },
              child: Text("Peminjaman"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePagePengembalian()),
                );
              },
              child: Text("Pengembalian"),
            ),
          ],
        ),
      ),
    );
  }
}
