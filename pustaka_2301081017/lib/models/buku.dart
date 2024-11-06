class Buku {
  final int? id;
  final String kodeAnggota;
  final String namaAnggota;
  final String judul;
  final String pengarang;
  final String penerbit;
  final int tahunTerbit;

  Buku({
    this.id,
    required this.kodeAnggota,
    required this.namaAnggota,
    required this.judul,
    required this.pengarang,
    required this.penerbit,
    required this.tahunTerbit,
  });

  // Method untuk mengkonversi data dari map ke objek Buku
  factory Buku.fromMap(Map<String, dynamic> json) {
    return Buku(
      id: json['id'] as int?,
      kodeAnggota: json['kodeAnggota'] as String,
      namaAnggota: json['namaAnggota'] as String,
      judul: json['judul'] as String,
      pengarang: json['pengarang'] as String,
      penerbit: json['penerbit'] as String,
      tahunTerbit: json['tahunTerbit'] as int,
    );
  }

  // Method untuk mengkonversi objek Buku ke map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kodeAnggota': kodeAnggota,
      'namaAnggota': namaAnggota,
      'judul': judul,
      'pengarang': pengarang,
      'penerbit': penerbit,
      'tahunTerbit': tahunTerbit,
    };
  }
}
