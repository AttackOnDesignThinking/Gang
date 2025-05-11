import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'profile_list_screen.dart';
//나중에 네이버 지도로 바꾸자

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.5215, 126.9249); // 여의도 위치
  final List<Map<String, dynamic>> locations = [
    {'id': 1, 'name': '여의도', 'lat': 37.5215, 'lng': 126.9249, 'users': 50},
    {'id': 2, 'name': '샛강', 'lat': 37.5165, 'lng': 126.9289, 'users': 30},
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCircleTap(int locationId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileListScreen(locationId: locationId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도 화면'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        circles: locations.map((location) {
          return Circle(
            circleId: CircleId(location['id'].toString()),
            center: LatLng(location['lat'], location['lng']),
            radius: 100, // 반경
            fillColor: Color.fromRGBO(255, 255, 0, 0.5), // Yellow with 50% opacity
            strokeColor: Colors.yellow,
            strokeWidth: 2,
            onTap: () => _onCircleTap(location['id']),
          );
        }).toSet(),
      ),
    );
  }
}