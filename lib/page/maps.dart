import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logastics/controller/lokasicontroller.dart';
import 'package:lottie/lottie.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _HomePageState();
}

class _HomePageState extends State<Maps> {
  final LokasiController _lokasiController = LokasiController();
  //get map controller to access map
  final Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedtLatLng;
  late String stringLatLng;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    //set default latlng for camera position
    _defaultLatLng = const LatLng(-7, 130);
    _draggedtLatLng = _defaultLatLng;
    stringLatLng = _draggedtLatLng.toString();
    _cameraPosition =
        CameraPosition(target: _defaultLatLng, zoom: 15 // number of map view
            );

    //map will redirect to my current location when loaded
    _gotoUserCurrentPosition();
    getLatlong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(children: [ _getCustomPin(), _showDraggedAddress()]);
  }

  Widget _showDraggedAddress() {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(71, 109, 109, 109).withOpacity(0.15),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromRGBO(249, 1, 131, 1.0),
                      onPressed: () {
                        _gotoUserCurrentPosition();
                      },
                      child: const Icon(Icons.gps_fixed),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(249, 1, 131, 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Salin alamat ketika teks diketuk
                            Clipboard.setData(ClipboardData(
                                text: _lokasiController.draggedAddress));
                            // Tampilkan pesan atau umpan balik lainnya
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Alamat disalin ke clipboard'),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.symmetric(
                                vertical: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                _lokasiController.draggedAddress,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Salin alamat ketika teks diketuk
                            Clipboard.setData(
                                ClipboardData(text: _lokasiController.latlong));
                            // Tampilkan pesan atau umpan balik lainnya
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Koordinat disalin ke clipboard'),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              _lokasiController.latlong,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Form(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: TextFormField(
                                  controller: _lokasiController.txtKeterangan,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  decoration: const InputDecoration(
                                    labelText: "Tambahkan Keterangan",
                                    labelStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 122, 122, 122)
                                          .withOpacity(0.55), // Warna bayangan
                                  spreadRadius:
                                      0, // Seberapa jauh bayangan menyebar
                                  blurRadius: 5, // Seberapa kabur bayangan
                                  offset: const Offset(
                                      0, 4), // Posisi bayangan (x, y)
                                ),
                              ],
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                              ),
                              onPressed: () {
                                _lokasiController.Addlocation();
                              },
                              child: const Text(
                                "Update",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getMap() {
    return GoogleMap(
      initialCameraPosition:
          _cameraPosition!, //initialize camera position for map
      mapType: MapType.normal,
      onCameraIdle: () {
        //this function will trigger when user stop dragging on map
        //every time user drag and stop it will display address
        _getAddress(_draggedtLatLng);
      },
      onCameraMove: (cameraPosition) {
        //this function will trigger when user keep dragging on map
        //every time user drag this will get value of latlng
        _draggedtLatLng = cameraPosition.target;
        stringLatLng = _draggedtLatLng.toString();
        getLatlong();
      },
      onMapCreated: (GoogleMapController controller) {
        //this function will trigger when map is fully loaded
        if (!_googleMapController.isCompleted) {
          //set controller to google map when it is fully loaded
          _googleMapController.complete(controller);
        }
      },
    );
  }

  Widget _getCustomPin() {
    return Center(
      child: SizedBox(
        width: 50,
        child: Lottie.asset("assets/js/my_location.json"),
      ),
    );
  }

  //get address from dragged pin
  Future _getAddress(LatLng position) async {
    //this will list down all address around the position
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0]; // get only first and closest address
    String addresStr =
        "${address.street}, ${address.subLocality}, ${address.subAdministrativeArea}, ${address.administrativeArea}, ${address.country}";
    setState(() {
      _lokasiController.draggedAddress = addresStr;
    });
  }

  Future getLatlong() async {
    final match = RegExp(r'LatLng\(([^)]+)\)').firstMatch(stringLatLng);

    if (match != null) {
      final latLngString = match.group(1);
      setState(() {
        _lokasiController.latlong = '$latLngString';
      });
    }
  }

  //get user's current location and set the map's camera to that location
  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  //go to specific position by latlng
  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 17.5)));
    //every time that we dragged pin , it will list down the address here
    await _getAddress(position);
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if (!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();

    //check if user denied location and retry requesting for permission
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    //check if user denied permission forever
    if (locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }
}
