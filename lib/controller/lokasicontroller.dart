// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logastics/provider/TransaksiProvider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LokasiController extends GetxController {
  var id = SpUtil.getInt('id')!;
  String? id_tujuan;
  late String alamat = "";
  late String latlong = "";
  TextEditingController txtKeterangan = TextEditingController();
  List<int> id_dipilih = [];
  List<int> id_listtransaksi = [];

  void Addlocation() {
    EasyLoading.dismiss();
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
      EasyLoading.show();
      TransaksiProvider().getDataDetailpesanan(id_tujuan).then((value) {
        print(value.statusCode);
        if (value.statusCode == 200) {
          var data = value.body['datauser'];
          for (var element in data) {
            id_dipilih.add(element['id_transaksi']);
          }
          TransaksiProvider().getDataByIdKurir(id).then((value) {
            print(value.statusCode);
            if (value.statusCode == 200) {
              var data = value.body['data'];
              for (var element in data) {
                var id_transaksi = element['id_transaksi'];
                if (!id_dipilih.contains(id_transaksi)) {
                  id_listtransaksi.add(id_transaksi);
                }
              }
              var data_tujuan = {
                "id_transaksi": id_dipilih,
                "alamat_lokasi_tujuan": alamat,
                "koordinat_lokasi": latlong,
                "keterangan": "Kurir sedang menuju ke lokasi Anda"
              };
              TransaksiProvider().updateLokasi(data_tujuan).then((value) {
                print(value.statusCode);
                if (value.statusCode == 200) {
                  if (id_listtransaksi.isNotEmpty) {
                    var data = {
                      "id_transaksi": id_listtransaksi,
                      "alamat_lokasi_tujuan": alamat,
                      "koordinat_lokasi": latlong,
                      "keterangan": keterangan
                    };
                    TransaksiProvider().updateLokasi(data).then((value) {
                      print(value.statusCode);
                      if (value.statusCode == 200) {
                        Get.snackbar(
                          "Successs",
                          "Berhasil memperbarui lokasi ${(id_tujuan)}",
                          backgroundColor: Colors.green.withOpacity(0.85),
                          colorText: Colors.white,
                        );
                        Get.offAllNamed('/home');
                        EasyLoading.dismiss();
                      }
                    });
                  } else {
                    Get.snackbar(
                      "Successs",
                      "Berhasil memperbarui lokasi ${(id_tujuan)}",
                      backgroundColor: Colors.green.withOpacity(0.85),
                      colorText: Colors.white,
                    );
                    Get.offAllNamed('/home');
                    EasyLoading.dismiss();
                  }
                }
              });
            }
          });
        }
      });
    }
    EasyLoading.dismiss();
  }
}
