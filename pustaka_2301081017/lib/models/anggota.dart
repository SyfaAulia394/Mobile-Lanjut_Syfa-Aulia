class Anggota {
  final int? id;
  final String kodeAnggota;
  final String namaAnggota;
  final String alamat;
  final String jenisKelamin;
  final String peminjaman;
  final String pengembalian;

  Anggota({
    this.id,
    required this.kodeAnggota,
    required this.namaAnggota,
    required this.alamat,
    required this.jenisKelamin,
    required this.peminjaman,
    required this.pengembalian,
  });

  // Method untuk mengkonversi data dari map ke objek Anggota
  factory Anggota.fromMap(Map<String, dynamic> json) {
    return Anggota(
      id: json['id'] as int?,
      kodeAnggota: json['kodeAnggota'] as String,
      namaAnggota: json['namaAnggota'] as String,
      alamat: json['alamat'] as String,
      jenisKelamin: json['jenisKelamin'] as String,
      peminjaman: json['peminjaman'] as String,
      pengembalian: json['pengembalian'] as String,
    );
  }

  // Method untuk mengkonversi objek Anggota ke map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kodeAnggota': kodeAnggota,
      'namaAnggota': namaAnggota,
      'alamat': alamat,
      'jenisKelamin': jenisKelamin,
      'peminjaman': peminjaman,
      'pengembalian': pengembalian,
    };
  }
}
