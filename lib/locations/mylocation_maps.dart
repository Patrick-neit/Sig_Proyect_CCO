import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  final LatLng myubi =
      const LatLng(-17.7335177, -63.1256928); //var to send through my api

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();

//Posicion inicial
  final CameraPosition _initialubication = const CameraPosition(
    target: LatLng(-17.7335177, -63.1256928), //Mi casita xd
    zoom: 16,
  );

  static const CameraPosition camPositionUb = CameraPosition(
      //Place position destination (Ficct)
      bearing: 192.8334901395799,
      target: LatLng(-17.7760277, -63.1953877),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialubication,
        myLocationButtonEnabled: true, //Hide the buttom witch contains my ub
        scrollGesturesEnabled: true, //Block/allow the Scrolled movement
        zoomGesturesEnabled: false, //Block the zoom
        compassEnabled: true, //Gira el mapa

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheFicct,
        label: const Text('Seguir trayectoria'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheFicct() async {
    // _getMyPosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(camPositionUb));
  }

//  Future<void> _getMyPosition() async {
  //  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  // }
}
