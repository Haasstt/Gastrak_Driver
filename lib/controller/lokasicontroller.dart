// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logastics/provider/TransaksiProvider.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

class LokasiController extends GetxController {
  String? id_tujuan;
  late String alamat = "";
  late String latlong = "";
  TextEditingController txtKeterangan = TextEditingController();
  List<String> id_dipilih = [];

  void Addlocation() {
    String keterangan = txtKeterangan.text;
    if (alamat.isEmpty || latlong.isEmpty) {
      Get.snackbar(
        "Gagal memperbarui lokasi",
        "Alamat belum didapatkan",
        backgroundColor: Colors.red.withOpacity(0.50),
        colorText: Colors.white,
      );
    } else if (id_tujuan == null) {
      Get.snackbar(
        "Gagal memperbarui lokasi",
        "Tujuan pengiriman tidak ada",
        backgroundColor: Colors.red.withOpacity(0.50),
        colorText: Colors.white,
      );
    } else if (keterangan.isEmpty) {
      Get.snackbar(
        "Gagal memperbarui lokasi",
        "Mohon untuk menambahkan keterangan",
        backgroundColor: Colors.red.withOpacity(0.50),
        colorText: Colors.white,
      );
    } else {
      TransaksiProvider().getDataDetailpesanan(id_tujuan).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser'];
        // print(value.body);
        for (var element in data) { 
            id_dipilih.add(element['id_transaksi']);
        }
      print(alamat);
      print(latlong);
      print(keterangan);
      Get.snackbar(
        "Successs",
        "Berhasil memperbarui lokasi ${(id_tujuan)}",
        backgroundColor: Colors.green.withOpacity(0.85),
        colorText: Colors.white,
      );
        // print(DataDetailPesanan);
      }
    });
    }
  }
}
