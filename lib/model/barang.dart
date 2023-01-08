class Barang {
  String id;
  String nama_kue;

  Barang({required this.id, required this.nama_kue});

  factory Barang.fromJson(Map<String, dynamic> barang) =>
      Barang(id: barang['id'], nama_kue: barang['nama_kue']);
}
