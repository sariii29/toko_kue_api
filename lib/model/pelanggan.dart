class Pelanggan {
  String nama;
  String alamat;
  String tanggalBeli;
  int barangId;

  Pelanggan({
    required this.nama,
    required this.alamat,
    required this.tanggalBeli,
    required this.barangId,
  });

  factory Pelanggan.fromJson(Map<String, dynamic> pelanggan) => Pelanggan(
        nama: pelanggan['nama'],
        alamat: pelanggan['alamat'],
        tanggalBeli: pelanggan['tanggal_beli'],
        barangId: pelanggan['barang_id'],
      );

  Map<String, dynamic> toJson() {
    var data = {
      'nama': nama,
      'alamat': alamat,
      'tanggal_beli': tanggalBeli,
      'barang_id': barangId,
    };
    return data;
  }
}
