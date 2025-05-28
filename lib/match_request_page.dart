import 'package:flutter/material.dart';
import 'match_request_popup.dart';

class MatchRequestPage extends StatelessWidget {
  final String placeName;
  final String userName;

  const MatchRequestPage({
    super.key,
    this.placeName = '여의도 한강공원',
    this.userName = '김나연님',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text(
          '매치 요청 보냄',
          style: TextStyle(
            color: Color(0xFFBDBDBD),
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // 지도 이미지 (샘플 이미지 대체)
            Container(
              width: 270,
              height: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/yeouido_map_sample.png',
                  ), // 지도 샘플이미지
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: const Alignment(0.04, -0.15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.park, color: Colors.red, size: 40),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            placeName,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: 270,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Text(
                    '$userName에게 만남을 요청하시겠어요?',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF282828),
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
                            mapAsset: 'assets/yeouido_map_sample.png',
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
                          // 아니요 버튼 동작
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
          ],
        ),
      ),
    );
  }
}
