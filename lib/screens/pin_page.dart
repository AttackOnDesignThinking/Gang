import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'met_page.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  static const LatLng initialLatLng = LatLng(37.5271, 126.9326);
  LatLng? selectedLatLng;
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Color(0xFFBDBDBD))),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 750, // 지도 높이 확장
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey[200],
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: initialLatLng,
                    zoom: 16,
                  ),
                  markers: {
                    if (selectedLatLng != null)
                      Marker(
                        markerId: const MarkerId('selected'),
                        position: selectedLatLng!,
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                      ),
                  },
                  onTap: (LatLng latLng) {
                    setState(() {
                      selectedLatLng = latLng;
                    });
                  },
                  zoomControlsEnabled: true, // 확대/축소 컨트롤 버튼 활성화
                  myLocationButtonEnabled: false,
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  // 제스처로 확대/축소 가능 (기본값 true, 명시적으로 추가)
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                ),
                const Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      '만나고 싶은 장소를 클릭하세요',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: selectedLatLng == null
                ? null
                : () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MetPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedLatLng == null
                  ? Colors.grey[400]
                  : const Color(0xFF19C37D),
              minimumSize: const Size(160, 46),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: const Text(
              '이 장소에서 만나요!',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}