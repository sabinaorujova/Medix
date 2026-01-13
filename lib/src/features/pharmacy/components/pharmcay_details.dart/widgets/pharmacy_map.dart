import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PharmacyMapPage extends StatefulWidget {
  final double latitude;
  final double longitude;

  const PharmacyMapPage({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<PharmacyMapPage> createState() => _PharmacyMapPageState();
}

class _PharmacyMapPageState extends State<PharmacyMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aptekin Yeri'),
      ),
      body: Expanded(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude),
            zoom: 14.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId('pharmacyLocation'),
              position: LatLng(widget.latitude, widget.longitude),
              infoWindow: InfoWindow(
                title: 'Aptek',
              ),
            ),
          },
        ),
      ),
    );
  }
}