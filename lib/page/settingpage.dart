import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logastics/animation/BounceAnimation.dart';
import 'package:logastics/page/notfoundpage.dart';
import 'package:logastics/page/setting/setting_akun.dart';
// ignore: depend_on_referenced_packages
import 'package:sp_util/sp_util.dart';
import 'package:page_transition/page_transition.dart';
import 'package:logastics/animation/animations.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  Future<void> _showConfirmationDialog(BuildContext context) async {
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
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
            TextButton(
                child: const Text('Ya'),
                onPressed: () {
                  SpUtil.clear();
                  Get.offAllNamed('/cover');
                }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
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
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 2),
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeAnimation(
                    0.5,
                    Container(
                      width: double.infinity,
                      height: 260,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.25), // Warna bayangan
                            spreadRadius: 0, // Seberapa jauh bayangan menyebar
                            blurRadius: 4, // Seberapa kabur bayangan
                            offset:
                                const Offset(0, 1), // Posisi bayangan (x, y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 30, left: 30, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeAnimation(
                              0.5,
                              Container(
                                width: double.infinity,
                                height: 60,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Akun',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'Poppins',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.5,
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const Changename(),
                                          type: PageTransitionType.rightToLeft,
                                        ));
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          FaIcon(FontAwesomeIcons.solidUser,
                                              size: 20, color: Colors.black),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Username',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.6,
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const Changeemail(),
                                          type: PageTransitionType.rightToLeft,
                                        ));
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.email,
                                              size: 20, color: Colors.black),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Email',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.6,
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const Changephone(),
                                          type: PageTransitionType.rightToLeft,
                                        ));
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.phone,
                                              size: 20, color: Colors.black),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'No. Phone',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.7,
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const Changepassword(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.lock,
                                              size: 20, color: Colors.black),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Ubah Password',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FadeAnimation(
                    0.6,
                    Container(
                      width: double.infinity,
                      height: 260,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.25), // Warna bayangan
                            spreadRadius: 0, // Seberapa jauh bayangan menyebar
                            blurRadius: 4, // Seberapa kabur bayangan
                            offset:
                                const Offset(0, 1), // Posisi bayangan (x, y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 30, left: 30, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeAnimation(
                              0.7,
                              Container(
                                width: double.infinity,
                                height: 60,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Setting',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'Poppins',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.8,
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const NotFoundPage(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.help_outline_outlined,
                                              size: 20, color: Colors.black),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Pusat Bantuan',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.8,
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const NotFoundPage(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.security_outlined,
                                              size: 20, color: Colors.black),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Kebijakan Gastrack',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.9,
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const NotFoundPage(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.contact_page_outlined,
                                              size: 20, color: Colors.black),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Kontak Kami',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            FadeAnimation(
                              0.9,
                              Container(
                                width: double.infinity,
                                height: 40,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const NotFoundPage(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.flag,
                                              size: 20, color: Colors.black),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Laporkan Masalah',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.chevronRight,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BounceAnimation(
                    0.8,
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(249, 1, 131, 1.0),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 122, 122, 122)
                                  .withOpacity(0.25), // Warna bayangan
                              spreadRadius:
                                  0, // Seberapa jauh bayangan menyebar
                              blurRadius: 5, // Seberapa kabur bayangan
                              offset:
                                  const Offset(0, 1), // Posisi bayangan (x, y)
                            ),
                          ],
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                          ),
                          onPressed: () {
                            _showConfirmationDialog(context);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Keluar",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.logout_outlined,
                                size: 15,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
}
