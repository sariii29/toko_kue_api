import 'package:toko_kue_api/model/barang.dart';

class BarangRead {
  BarangRead({required this.success, required this.barangs});

  bool success;
  List<Barang> barangs;

  factory BarangRead.fromJson(Map<String, dynamic> json) => BarangRead(
      success: json['success'],
      barangs: List<Barang>.from(json['data'].map((x) => Barang.fromJson(x))));
}
