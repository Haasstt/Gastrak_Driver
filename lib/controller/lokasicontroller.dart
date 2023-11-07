// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logastics/provider/TransaksiProvider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LokasiController extends GetxController {
  String? tujuan;
  late String alamat = "";
  late String latlong = "";
  TextEditingController txtKeterangan = TextEditingController();
  List<Map<String, dynamic>> id_dipilih = [];

  void GetIdTujuan(id) {
    EasyLoading.show();
    TransaksiProvider().getDataDetailpesanan(id).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser'];
        for (var element in data) {
          id_dipilih.add(element);
        }
        EasyLoading.dismiss();
      }
    });
  }

  void Addlocation() {
    String keterangan = txtKeterangan.text;
    if (alamat.isEmpty ||
        latlong.isEmpty ||
        keterangan.isEmpty ||
        id_dipilih.isEmpty) {
      Get.snackbar(
        "Gagal memperbarui lokasi",
        "Data input masih ada yang kosong",
        backgroundColor: Colors.red.withOpacity(0.50),
        colorText: Colors.white,
      );
    } else {
      print(id_dipilih);
      print(alamat);
      print(latlong);
      print(keterangan);
      Get.snackbar(
        "Successs",
        "Berhasil memperbarui lokasi ${(tujuan)}",
        backgroundColor: Colors.green.withOpacity(0.85),
        colorText: Colors.white,
      );
      Get.offAllNamed('/home');
    }
  }
}
