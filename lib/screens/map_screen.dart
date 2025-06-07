import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/custom_marker.dart';
import 'profile_list_screen.dart';

class BubbleMapPage extends StatefulWidget {
  const BubbleMapPage({Key? key}) : super(key: key);

  @override
  State<BubbleMapPage> createState() => _BubbleMapPageState();
}

class _BubbleMapPageState extends State<BubbleMapPage> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  final List<Map<String, dynamic>> markerData = [
    {
      'lat': 37.5245,
      'lng': 126.928,
      'value': 90,
      'locationId': 1,
    },
  ];

  double getCircleSize(int value) =>
      60 + (value.clamp(0, 100) / 100) * 60; // 60~120
  double getFontSize(int value) =>
      18 + (value.clamp(0, 100) / 100) * 16; // 18~34

  @override
  void initState() {
    super.initState();
    _initMarkers();
  }

  Future<void> _initMarkers() async {
    for (var data in markerData) {
      double circleSize = getCircleSize(data['value']);
      double fontSize = getFontSize(data['value']);
      Uint8List markerIcon = await createBubbleMarker(
        data['value'],
        Colors.amber,
      );
      _markers.add(
        Marker(
          markerId: MarkerId('${data['lat']},${data['lng']}'),
          position: LatLng(data['lat'], data['lng']),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProfileListScreen(locationId: data['locationId']),
              ),
            );
          },
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.526, 126.93),
          zoom: 14,
        ),
        onMapCreated: (controller) => _mapController = controller,
        markers: _markers,
      ),
    );
  }
}