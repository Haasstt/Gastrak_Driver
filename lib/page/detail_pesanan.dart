// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:logastics/animation/animations.dart';
import 'package:logastics/provider/TransaksiProvider.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sp_util/sp_util.dart';

class DetailPesanan extends StatefulWidget {
  const DetailPesanan({super.key, required this.id, required this.agen});

  final int id;
  final String agen;

  @override
  State<DetailPesanan> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<DetailPesanan> {
  late var id = widget.id.toInt();
  late var nama_agen = widget.agen;
  List<Map<String, dynamic>> DataDetailPesanan = [];

  Future<void> _showConfirmationDialog(
      BuildContext context, int id_transaksi) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Dialog tidak bisa ditutup dengan mengetuk di luar dialog
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                20.0), // Atur BorderRadius sesuai kebutuhan
          ),
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin melanjutkan?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batalkan'),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
            TextButton(
                child: const Text('Lanjutkan'),
                onPressed: () {
                  UpdateTransaksi(id_transaksi);
                }),
          ],
        );
      },
    );
  }

  void UpdateTransaksi(int id_transaksi) {
    EasyLoading.show();
    var data = {
      "token": 'Bearer ${SpUtil.getString('token')!}',
    };

    TransaksiProvider().updatePesananSelesai(id_transaksi, data).then((value) {
      var pesan = value.body['message'];
      if (value.statusCode == 200) {
        Get.snackbar(
          "Successs",
          pesan,
          backgroundColor: Colors.green.withOpacity(0.85),
          colorText: Colors.white,
        );
        Get.offAllNamed('/home');
      } else if (value.statusCode == 422) {
        Get.snackbar(
          "Failed",
          pesan,
          backgroundColor: Colors.red.withOpacity(0.50),
          colorText: Colors.white,
        );
      } else if (value.hasError == true) {
        Get.snackbar(
          "Server Not Responding",
          'Gagal menghubungka ke server',
          colorText: Colors.white,
        );
      }
      EasyLoading.dismiss();
    });
  }

  @override
  void initState() {
    TransaksiProvider().getDataDetailpesanan(id).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser'];
        // print(value.body);
        for (var element in data) {
          setState(() {
            DataDetailPesanan.add(element);
          });
        }
        print(DataDetailPesanan);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: Center(
              child: Text(
                'Detail Pesanan Agen ${(nama_agen)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: DataDetailPesanan.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: DataDetailPesanan.map((index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeAnimation(
                                  0.9,
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    "Resi ",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${index['resi_pengiriman']}",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black26),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Nama Produk ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  "${index['name_gas']} ${index['berat_gas']} Kg ${index['jenis_gas']}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Jumlah Pesanan ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  "${index['jumlah_transaksi']}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Tanggal Pemesanan ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  "${index['tanggal_transaksi']}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Total Pembayaran ",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  "Rp${index['total_transaksi']}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "${index['status_pengiriman']}",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: ElevatedButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          249, 1, 131, 1.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                  _showConfirmationDialog(
                                                      context,
                                                      index['id_transaksi']);
                                                },
                                                child: const Text(
                                                  "Pesanan diterima",
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Divider(), // Garis pemisah antara setiap entri
                        ],
                      );
                    }).toList(),
                  )));
  }
}
