import 'package:flutter/material.dart';
import 'package:toko_kue_api/api/api_service.dart';
import 'package:toko_kue_api/model/barang.dart';
import 'package:toko_kue_api/model/barangread.dart';
import 'package:toko_kue_api/screen/barang_create.dart';

class BarangList extends StatefulWidget {
  static const routeName = '/barang_list';

  const BarangList({Key? key}) : super(key: key);

  @override
  State<BarangList> createState() => _BarangListState();
}

class _BarangListState extends State<BarangList> {
  late Future<BarangRead> _future;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    _future = apiService.getBarang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membaca API Online'),
      ),
      body: Center(
        child: FutureBuilder<BarangRead>(
          future: _future,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final List<Barang> barangs = snapshot.data!.barangs;
                return ListView.builder(
                    itemCount: barangs.length,
                    itemBuilder: (context, index) {
                      return _buildBarangCard(context, barangs[index]);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, BarangCreate.routeName);
        },
      ),
    );
  }

  Widget _buildBarangCard(BuildContext context, Barang barang) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        barang.nama_kue,
      ),
    );
  }
}
