import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logastics/animation/BounceAnimation.dart';
import 'package:logastics/animation/animations.dart';

class OrderlistPage extends StatelessWidget {
  @override
  // ignore: override_on_non_overriding_member, non_constant_identifier_names
  final List<Map> Agents = [
    {
      "nama": "Agen Lpg Pak Sumarsono",
      "produk": "Gas LPG",
      "Jumlah": "20",
      "Alamat":
          "Jalan Waru Gunung, RT.005/RW.002, Krajan Kulon, Warugunung, Kec. Karangpilang, Kabupaten Sidoarjo, Jawa Timur"
    },
    {
      "nama": "Serayu Selatan",
      "produk": "Gas LPG",
      "Jumlah": "20",
      "Alamat":
          "Jl. Gedong No. 57, Banjarejo, Kota Madiun, Jawa Timur, Indonesia"
    },
    {
      "nama": "Serayu Selatan",
      "produk": "Gas LPG",
      "Jumlah": "20",
      "Alamat": "Jl. blablabla, nomor 34, Serayu, Madiun"
    },
    {
      "nama": "Serayu Selatan",
      "produk": "Gas LPG",
      "Jumlah": "20",
      "Alamat": "Jl. blablabla, nomor 34, Serayu, Madiun"
    },
    {
      "nama": "Serayu Selatan",
      "produk": "Gas LPG",
      "Jumlah": "20",
      "Alamat": "Jl. blablabla, nomor 34, Serayu, Madiun"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order List',
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
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: Agents.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: FadeAnimation(
                      0.5,
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.25), // Warna bayangan
                              spreadRadius:
                                  0, // Seberapa jauh bayangan menyebar
                              blurRadius: 4, // Seberapa kabur bayangan
                              offset:
                                  const Offset(0, 1), // Posisi bayangan (x, y)
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FadeAnimation(
                                1.0,
                                SizedBox(
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Agents[index]['nama'],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        Agents[index]['Alamat'],
                                        style: const TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            // ignore: prefer_interpolation_to_compose_strings
                                            'Produk : ' +
                                                Agents[index]['produk'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins-bold',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            // ignore: prefer_interpolation_to_compose_strings
                                            'Jumlah : ' +
                                                Agents[index]['Jumlah'],
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins-bold',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              BounceAnimation(
                                1.3,
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              249, 1, 131, 1.0),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
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
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                            onPressed: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: Agents[index]
                                                      ['Alamat']));
                                            },
                                            child: const Icon(
                                              Icons.copy,
                                              color: Colors.white,
                                            )),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
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
}
