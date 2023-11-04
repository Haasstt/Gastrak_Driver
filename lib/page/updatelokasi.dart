// ignore_for_file: unnecessary_import, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logastics/animation/BounceAnimation.dart';

class UpdateLokasi extends StatefulWidget {
  const UpdateLokasi({Key? key}) : super(key: key);

  @override
  State<UpdateLokasi> createState() => _HomePageState();
}

class _HomePageState extends State<UpdateLokasi> {
  String koordinat = "";
  String alamat = "";
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Lokasi',
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
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25), // Warna bayangan
                    spreadRadius: 0, // Seberapa jauh bayangan menyebar
                    blurRadius: 4, // Seberapa kabur bayangan
                    offset: const Offset(0, 1), // Posisi bayangan (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Color.fromRGBO(249, 1, 131, 1.0),
                          )
                        : ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(249, 1, 131, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                loading = true;
                              });

                              Position position =
                                  await _GetUserCurrentPosition();
                              setState(() {
                                koordinat =
                                    '${position.latitude}, ${position.longitude}';
                              });

                              _getAddress(position);

                              setState(() {
                                loading = false;
                              });
                            },
                            child: const Text(
                              "Dapatkan Lokasi",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                  ),
                  loading
                      ? const Text('')
                      : Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  border: Border.all(
                                    width: 1,
                                    color: koordinat == "" && alamat == ""
                                        ? const Color.fromARGB(255, 255, 0, 0)
                                        : const Color.fromARGB(255, 9, 255, 0),
                                  )),
                              child: Center(
                                child: koordinat == "" && alamat == ""
                                    ? const FaIcon(
                                        FontAwesomeIcons.exclamation,
                                        size: 10,
                                        color: Color.fromARGB(255, 255, 0, 0),
                                      )
                                    : const FaIcon(
                                        FontAwesomeIcons.check,
                                        size: 10,
                                        color: Color.fromARGB(255, 9, 255, 0),
                                      ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: koordinat == "" && alamat == ""
                                    ? const Text(
                                        "Klik tombol untuk mendapatkan lokasi terbaru Anda",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          color: Color.fromARGB(255, 255, 0, 0),
                                        ),
                                      )
                                    : const Text(
                                        "Lokasi berhasil didapat",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          color: Color.fromARGB(255, 9, 255, 0),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Titik Koordinat',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          (koordinat),
                          style: const TextStyle(
                            height: 2,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Text(
                          'Alamat',
                          style: TextStyle(
                            height: 2,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          (alamat),
                          style: const TextStyle(
                            height: 2,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tentukan Tujuan Anda',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keterangan',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: BounceAnimation(
                      0.5,
                      Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(249, 1, 131, 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit_location_alt_outlined,
                                size: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Update Lokasi Anda",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
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

  Future _GetUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    //check if user enable service for location permission
    if (!isLocationServiceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();

    //check if user denied location and retry requesting for permission
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("user denied location permission");
      }
    }

    //check if user denied permission forever
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("user denied permission forever");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  //get address from dragged pin
  Future _getAddress(Position position) async {
    //this will list down all address around the position
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark address = placemarks[0]; // get only first and closest address
    String addresStr =
        "${address.street}, ${address.subLocality}, ${address.subAdministrativeArea}, ${address.administrativeArea}, ${address.country}";
    setState(() {
      alamat = addresStr;
    });
  }
}
