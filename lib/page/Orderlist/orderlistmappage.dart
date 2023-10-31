import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logastics/page/orderlist/orderlistpage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderlistmapPage extends StatelessWidget {
  const OrderlistmapPage({super.key});

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
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                      child: OrderlistPage(),
                      type: PageTransitionType.fade,
                    ));
              },
              child: const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.map,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Maps",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(-7.656575, 111.528810),
              zoom: 12.0, // Tingkat zoom awal
            ),
            circles: {
              Circle(
                circleId: const CircleId('circle_1'), // ID lingkaran
                center: const LatLng(
                    -7.632977, 111.512203), // Koordinat pusat lingkaran
                radius: 1000, // Radius lingkaran dalam meter
                fillColor: Colors.blue
                    .withOpacity(0.3), // Warna dan opacity (kejelasan)
                strokeWidth:
                    0, // Lebar garis tepi lingkaran (0 untuk tidak ada tepi)
              ),
            },
            markers: {
              Marker(
                markerId: const MarkerId('value'),
                position: const LatLng(-7.632977, 111.512203),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
                anchor:
                    const Offset(0.5, 0.5), // Pusat rotasi ikon (pusat ikon)
                // rotation: 45.0, // Sudut rotasi ikon dalam derajat
              ),
            },
          ),
          Container(
            width: double.infinity,
            height: 30,
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
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
          ),
        ],
      ),
    );
  }
}
