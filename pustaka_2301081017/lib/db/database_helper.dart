import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '/models/anggota.dart';
import '/models/buku.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('perpustakaan.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE anggota (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        kodeAnggota TEXT NOT NULL,
        namaAnggota TEXT NOT NULL,
        alamat TEXT NOT NULL,
        jenisKelamin TEXT NOT NULL,
        peminjaman TEXT NOT NULL,
        pengembalian TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE buku (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        kodeAnggota TEXT NOT NULL,
        namaAnggota TEXT NOT NULL,
        judul TEXT NOT NULL,
        pengarang TEXT NOT NULL,
        penerbit TEXT NOT NULL,
        tahunTerbit INTEGER NOT NULL,
        FOREIGN KEY (kodeAnggota) REFERENCES anggota (kodeAnggota)
      )
    ''');
  }

  Future<int> insertAnggota(Anggota anggota) async {
    final db = await instance.database;
    return await db.insert('anggota', anggota.toMap());
  }

  Future<int> insertBuku(Buku buku) async {
    final db = await instance.database;
    return await db.insert('buku', buku.toMap());
  }

  Future<List<Anggota>> fetchAnggota() async {
    final db = await instance.database;
    final result = await db.query('anggota');
    return result.map((json) => Anggota.fromMap(json)).toList();
  }

  Future<List<Buku>> fetchBuku() async {
    final db = await instance.database;
    final result = await db.query('buku');
    return result.map((json) => Buku.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
