import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LokasiController extends GetxController {
  String draggedAddress = "Menentukan lokasi Anda";
  TextEditingController txtKeterangan = TextEditingController();
  late String latlong = "....";

  void Addlocation() {
    String keterangan = txtKeterangan.text;
    print(draggedAddress);
    print(latlong);
    print(keterangan);
  }
}
