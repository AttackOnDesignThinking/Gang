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
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

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
          // 상단 텍스트박스 영역 추가
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "만남을 위한 상세설명을 적어주세요!",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue[200]!),
                ),
              ),
              style: const TextStyle(fontSize: 16),
              maxLength: 50,
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 680, // 지도 높이 확장
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
                          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure), // 파란색 핀
                        ),
                    },
                    onTap: (LatLng latLng) async {
                      setState(() {
                        selectedLatLng = latLng;
                      });
                      // 지도 중앙을 선택한 위치로 이동
                      await _mapController?.animateCamera(
                        CameraUpdate.newLatLng(latLng),
                      );
                    },
                    zoomControlsEnabled: true, // 확대/축소 컨트롤 버튼 활성화
                    myLocationButtonEnabled: false,
                    onMapCreated: (controller) {
                      _mapController = controller;
                    },
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
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: selectedLatLng == null
                ? null
                : () {
              // 예시: MetPage에 message를 전달하려면 Navigator.push에 인자 전달 추가
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MetPage(),
                  // 예시: builder: (_) => MetPage(message: _messageController.text),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedLatLng == null
                  ? Colors.grey[400]
                  : const Color(0xFF3497FA),
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