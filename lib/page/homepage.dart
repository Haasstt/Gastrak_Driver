// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logastics/animation/BounceAnimation.dart';
import 'package:logastics/provider/UserProvider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:another_flushbar/flushbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Homepage> {
  List<Map<String, dynamic>> Datauser = [];
  late var message = "";
  bool gagalmemuat = false;

  void GetData() {
    setState(() {
      gagalmemuat = false;
    });
    UserProvider().getDatauser(SpUtil.getInt('id')).then((value) {
      if (value.statusCode == 200) {
        var data = value.body['datauser'];
        setState(() {
          Datauser.add(data);
        });
        EasyLoading.dismiss();
      } else if (value.hasError == true) {
        var pesan = "Gagal Memuat, hubungkan perangkat ke jaringan";
        setState(() {
          message = pesan;
          gagalmemuat = !gagalmemuat;
        });
        Flushbar(
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.all(10),
          borderRadius: BorderRadius.circular(8),
          message: message,
          icon: const Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        ).show(context);
        EasyLoading.dismiss();
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(128, 38, 198, 1.0),
                  Color.fromRGBO(249, 1, 131, 1.0),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Image.asset(
                                        "assets/img/logo_white.png",
                                        width: 25,
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/img/Logastics2.png",
                                      width: 120,
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          'Menjadi pengemudi yang aman dan terpercaya',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 14,
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
                        Image.asset(
                          "assets/img/img_home.png",
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.70,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        top: -50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.15), // Warna bayangan
                                  spreadRadius:
                                      0, // Seberapa jauh bayangan menyebar
                                  blurRadius: 4, // Seberapa kabur bayangan
                                  offset: const Offset(
                                      1, 1), // Posisi bayangan (x, y)
                                ),
                              ],
                            ),
                            height: 80,
                            child: Datauser.isEmpty
                                ? gagalmemuat
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Gagal Memuat',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Shimmer.fromColors(
                                        baseColor: const Color.fromARGB(
                                            255, 241, 241, 241),
                                        highlightColor: const Color.fromARGB(
                                            255, 252, 252, 252),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${(Datauser[0]['name'])}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Poppins-bold',
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              '${(Datauser[0]['role'])}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                color: Colors.black45,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Expanded(
                                child: BounceAnimation(
                                  0.5,
                                  Container(
                                    margin: const EdgeInsets.only(top: 40),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                                0.15), // Warna bayangan
                                            spreadRadius:
                                                0, // Seberapa jauh bayangan menyebar
                                            blurRadius:
                                                4, // Seberapa kabur bayangan
                                            offset: const Offset(
                                                0, 1), // Posisi bayangan (x, y)
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/updatelokasi');
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/img/Group_309.png",
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const SizedBox(
                                                  width: 200,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Lokasi Terkini',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Anda dapat memperbarui lokasi saat mengirim gas',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Image.asset(
                                                "assets/img/Group_310.png",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: BounceAnimation(
                                  0.6,
                                  Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                                0.15), // Warna bayangan
                                            spreadRadius:
                                                0, // Seberapa jauh bayangan menyebar
                                            blurRadius:
                                                4, // Seberapa kabur bayangan
                                            offset: const Offset(
                                                0, 1), // Posisi bayangan (x, y)
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/orderlist');
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/img/Group_308.png",
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const SizedBox(
                                                  width: 200,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Daftar Pesanan',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Daftar pesanan yang harus Anda antar',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Image.asset(
                                                "assets/img/Group_310.png",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: BounceAnimation(
                                  0.7,
                                  Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(
                                                0.15), // Warna bayangan
                                            spreadRadius:
                                                0, // Seberapa jauh bayangan menyebar
                                            blurRadius:
                                                4, // Seberapa kabur bayangan
                                            offset: const Offset(
                                                0, 1), // Posisi bayangan (x, y)
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/settings');
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/img/Group_307.png",
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const SizedBox(
                                                  width: 200,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Pengaturan',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins-bold',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        'Semua pengaturan termasuk akun Anda',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Image.asset(
                                                "assets/img/Group_310.png",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          gagalmemuat
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: InkWell(
                        onTap: () {
                          GetData();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(32, 0, 0, 0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 189, 189, 189)
                                    .withOpacity(0.15), // Warna bayangan
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: Row(
                            children: [
                              const Text(
                                'Ketuk untuk memuat ulang',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    color: Colors.white),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: const Icon(
                                  Icons.refresh_rounded,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Text(''),
        ],
      ),
    );
  }
}
