import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'match_request_popup.dart';

class MatchRequestPage extends StatelessWidget {
  final String placeName;
  final String userName;

  // 샘플 위치 (여의도 한강공원)
  static const LatLng parkLatLng = LatLng(37.5271, 126.9326);

  const MatchRequestPage({
    super.key,
    this.placeName = '여의도 한강공원',
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
            color: Color(0xFFBDBDBD),
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          // 구글 지도 전체화면
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: parkLatLng,
              zoom: 16,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('park'),
                position: parkLatLng,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              ),
            },
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            tiltGesturesEnabled: false,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            zoomGesturesEnabled: false,
            liteModeEnabled: true,
          ),
          // 하단 고정 카드형 팝업
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 11,
                  )
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$userName에게 만남을 요청하시겠어요?',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF282828),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF19C37D),
                          minimumSize: const Size(80, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          await showMatchAcceptedDialog(
                            context,
                            mapAsset: null, // 지도이미지 없앰
                          );
                          Navigator.pushNamed(context, '/pin_page');
                        },
                        child: const Text(
                          '예',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE94E4E),
                          minimumSize: const Size(80, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '아니요',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}