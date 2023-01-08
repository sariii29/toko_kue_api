import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toko_kue_api/model/barangread.dart';
import 'package:toko_kue_api/model/pelanggan.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2/kue_api/api/';
  Future<BarangRead> getBarang() async {
    final response = await http.get(Uri.parse("${baseUrl}barang/read.php"));
    if (response.statusCode == 200) {
      return BarangRead.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<http.Response> createBarang(String nama) async {
    final response = await http.post(
      Uri.parse("${baseUrl}barang/create.php"),
      body: jsonEncode(<String, String>{
        'nama': nama,
      }),
    );
    return response;
  }

  Future<http.Response> createPelanggan(Pelanggan pelanggan) async {
    final response = await http.post(
      Uri.parse("${baseUrl}pelanggan/create.php"),
      body: jsonEncode(pelanggan.toJson()),
    );
    return response;
  }
}
