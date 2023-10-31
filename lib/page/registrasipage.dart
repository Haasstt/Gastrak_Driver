import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          "PENDAFTARAN KURIR",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      body: SizedBox(
          child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset(
                      "assets/img/logo_text.png",
                      width: 250,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            'Hi selamat datang!! daftarkan diri Anda dan bergabung dengan perusahaan kami dengan cara mengubungi admin kami melalui beberapa kontak di bawah',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            'Syarat dan Ketentuan',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 350,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: 340,
                                    child: const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 350,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: 340,
                                    child: const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 350,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: 340,
                                    child: const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 350,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: 340,
                                    child: const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            'Tata Cara Mendaftar',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 350,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: 340,
                                    child: const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 350,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: 340,
                                    child: const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 350,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: 340,
                                    child: const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              width: 350,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 10,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    width: 340,
                                    child: const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            'Kontak',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Color.fromRGBO(244, 204, 29, 1.0),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 300,
                              child: const Text(
                                '+6827472832913',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.email_outlined,
                              color: Color.fromRGBO(244, 204, 29, 1.0),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 300,
                              child: const Text(
                                'Example_email@gmail.com',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Color.fromRGBO(244, 204, 29, 1.0),
                              size: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8),
                              width: 300,
                              child: const Text(
                                'Jln. Raya Madiun Caruban, Kota Madiun, 62621, Jawa Timur',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, bottom: 40),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            'Terima kasih telah membaca informasi di atas, jika dirasa masih ada di bingungkan dapat menghubungi kontak yang tertera.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
