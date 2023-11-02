// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, camel_case_types, prefer_final_fields, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logastics/animation/BounceAnimation.dart';
import 'package:logastics/animation/animations.dart';
import 'package:logastics/provider/TransaksiProvider.dart';
import 'package:sp_util/sp_util.dart';

class OrderlistPage extends StatefulWidget {
  const OrderlistPage({super.key});

  @override
  State<OrderlistPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderlistPage> {
  List<Map<String, dynamic>> Agents = [];
  bool _notResponding = false;
  bool gagalmemuat = false;
  var message = "";

  void GetData() {
    setState(() {
      gagalmemuat = false;
    });
    TransaksiProvider().getDatapesanan(SpUtil.getInt('id')).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser'];
        for (var element in data) {
          setState(() {
            Agents.add(element);
          });
        }
        // setState(() {
        //   Agents.add(data);
        // });
      } else if (value.hasError == true) {
        var pesan = "Gagal Memuat, hubungkan perangkat ke jaringan";
        setState(() {
          message = pesan;
          gagalmemuat = !gagalmemuat;
        });
      }
    });
  }

  @override
  void initState() {
    GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Pesanan',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(249, 1, 131, 1.0),
                Color.fromRGBO(128, 38, 198, 1.0)
              ], // Warna gradient
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Agents.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Color.fromRGBO(249, 1, 131, 1.0),
                    ))
                  : gagalmemuat == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            tidakadapesanan(
                              message: message,
                            ),
                            _notResponding == true
                                ? butonReload()
                                : const Text(""),
                          ],
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: Agents.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: FadeAnimation(
                                0.5,
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(
                                            0.25), // Warna bayangan
                                        spreadRadius:
                                            0, // Seberapa jauh bayangan menyebar
                                        blurRadius:
                                            4, // Seberapa kabur bayangan
                                        offset: const Offset(
                                            0, 1), // Posisi bayangan (x, y)
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FadeAnimation(
                                          1.0,
                                          SizedBox(
                                            height: 120,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  'assets/img/pin_logo.png',
                                                  width: 30,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FadeAnimation(
                                          1.1,
                                          SizedBox(
                                            height: 120,
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Agen ${(Agents[index]['name'])}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  Agents[index]['alamat'],
                                                  style: const TextStyle(
                                                    fontSize: 9,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  'Nomor Telepon : ${(Agents[index]['no_hp'])}',
                                                  style: const TextStyle(
                                                    fontSize: 9,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '(${(Agents[index]['jumlah_pesanan'].toString())}) Pesanan',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          print(Agents[index][
                                                                  'jumlah_pesanan']
                                                              .toString());
                                                        },
                                                        child: const Text(
                                                          'Detail Pesanan',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    249,
                                                                    1,
                                                                    131,
                                                                    1.0),
                                                            fontSize: 9,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        BounceAnimation(
                                          1.3,
                                          Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                            ),
                                            height: 120,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        249, 1, 131, 1.0),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(
                                                                0.5), // Warna bayangan
                                                        spreadRadius:
                                                            1, // Seberapa jauh bayangan menyebar
                                                        blurRadius:
                                                            4, // Seberapa kabur bayangan
                                                        offset: const Offset(0,
                                                            1), // Posisi bayangan (x, y)
                                                      ),
                                                    ],
                                                  ),
                                                  child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Clipboard.setData(
                                                            ClipboardData(
                                                                text: Agents[
                                                                        index][
                                                                    'koordinat']));
                                                      },
                                                      child: const Icon(
                                                        Icons.copy,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  child: Text(
                                                    "Salin Alamat",
                                                    style: TextStyle(
                                                      fontSize: 6,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 20,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(249, 1, 131, 1.0),
                    Color.fromRGBO(128, 38, 198, 1.0)
                  ], // Warna gradient
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
          ),
        ],
      ),
    );
  }

  InkWell butonReload() {
    return InkWell(
      onTap: () {
        GetData();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        width: 150,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh_rounded,
              color: Colors.grey.shade100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Muat ulang',
                style: TextStyle(
                    fontFamily: 'Poppins', color: Colors.grey.shade100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class tidakadapesanan extends StatelessWidget {
  const tidakadapesanan({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Poppins', color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
