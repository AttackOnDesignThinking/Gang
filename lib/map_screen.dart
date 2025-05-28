import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'custom_marker.dart';
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
      'lat': 37.528316,
      'lng': 126.932859,
      'value': 50,
      'locationId': 1, // locationId 추가
    },
    {
      'lat': 37.521907,
      'lng': 126.924964,
      'value': 30,
      'locationId': 2, // locationId 추가
    },
  ];

  @override
  void initState() {
    super.initState();
    _initMarkers();
  }

  Future<void> _initMarkers() async {
    for (var data in markerData) {
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
      appBar: AppBar(title: const Text('Bubble Marker Map')),
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