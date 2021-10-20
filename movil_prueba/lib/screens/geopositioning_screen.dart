import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeopositioningScreen extends StatefulWidget {
  const GeopositioningScreen({Key? key}) : super(key: key);

  @override
  State<GeopositioningScreen> createState() => _GeopositioningScreenState();
}

class _GeopositioningScreenState extends State<GeopositioningScreen> {
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    final CameraPosition pointinit = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 14.4746,
    );

    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: pointinit,
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.pushNamed(context, 'status');
        },
      ),
    );
  }
}
