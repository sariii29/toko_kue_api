import 'package:flutter/material.dart';
import 'package:toko_kue_api/screen/barang_create.dart';
import 'package:toko_kue_api/screen/barang_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: BarangList.routeName,
      routes: {
        BarangList.routeName: (context) => const BarangList(),
        BarangCreate.routeName: (context) => const BarangCreate(),
      },
    );
  }
}
