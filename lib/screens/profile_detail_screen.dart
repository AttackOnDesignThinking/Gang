import 'package:flutter/material.dart';
import 'match_request_page.dart'; // 반드시 import!

class ProfileDetailScreen extends StatelessWidget {
  final Map<String, dynamic> profile;

  const ProfileDetailScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final String name = profile['name'] ?? '이름없음';
    final String userId = profile['userId'] ?? '00000000';
    final List<String> tags = List<String>.from(profile['tags'] ?? []);
    final double mannerDepth = (profile['mannerDepth'] ?? 10).toDouble();
    final String bio = profile['bio'] ?? '자기소개가 없습니다.';
    final int meetingCount = profile['meetingCount'] ?? 0;

    // 돌고래 개수 결정
    int dolphinCount = 1;
    if (meetingCount >= 10) {
      dolphinCount = 3;
    } else if (meetingCount >= 3) {
      dolphinCount = 2;
    }
    List<Widget> dolphinIcons = List.generate(
      dolphinCount,
          (i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Image.asset(
          'lib/assets/dolphin.png',
          width: 28,
          height: 28,
        ),
      ),
    );

    // 수심이 깊을수록(숫자가 클수록) 매너가 낮음
    Color depthColor;
    if (mannerDepth >= 30) {
      depthColor = Colors.redAccent;
    } else if (mannerDepth >= 15) {
      depthColor = Colors.orange;
    } else if (mannerDepth >= 7) {
      depthColor = Colors.lightBlue;
    } else {
      depthColor = Colors.blueAccent;
    }

    // 수심 한줄 설명 (깊을수록 매너 낮음)
    String getDepthDesc(double d) {
      if (d >= 30) return '수심이 깊어요 – 매너가 부족해요!';
      if (d >= 15) return '조금 깊은 수심 – 매너에 주의가 필요해요';
      if (d >= 7) return '적당한 수심 – 보통 매너';
      return '얕은 수심 – 매너가 좋아요!';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          '프로필',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: 신고하기 기능 구현
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            child: const Text(
              '신고하기',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: 24,
                bottom: 90, // meet 버튼 공간 확보
              ),
              child: Column(
                children: [
                  // 카드 전체 감싸기
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 상단: 프로필 아이콘/이름/돌고래
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // 프로필 이미지
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.person, size: 38, color: Colors.grey),
                            ),
                            const SizedBox(width: 18),
                            // 이름 + ID + 돌고래
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        name,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        '#$userId',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(children: dolphinIcons),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),

                        // 수심도
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0, left: 2.0),
                          child: Row(
                            children: [
                              const Text(
                                '수심도',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.5,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.info_outline, size: 19, color: Colors.grey[500]),
                            ],
                          ),
                        ),
                        // 수심도 바
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      depthColor.withOpacity(0.65),
                                      Colors.cyanAccent.withOpacity(0.42)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: (mannerDepth.clamp(0, 50) / 50),
                                    backgroundColor: Colors.transparent,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 11),
                        Text(
                          '${mannerDepth.toStringAsFixed(1)}m — ${getDepthDesc(mannerDepth)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          '수심이 깊을수록 매너가 낮아집니다.',
                          style: TextStyle(
                            color: Color(0xFF97A1A9),
                            fontSize: 14.2,
                          ),
                        ),
                        const SizedBox(height: 28),

                        // 취미
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7FAFB),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '취미',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Text('📌', style: TextStyle(fontSize: 18)),
                                  const SizedBox(width: 7),
                                  Expanded(
                                    child: Text(
                                      tags.isNotEmpty ? tags.join(', ') : '등록된 취미가 없습니다.',
                                      style: const TextStyle(fontSize: 16.5, color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 18),

                        // 자기소개
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7FAFB),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '자기소개',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('🖐️', style: TextStyle(fontSize: 18)),
                                  const SizedBox(width: 7),
                                  Expanded(
                                    child: Text(
                                      bio,
                                      style: const TextStyle(fontSize: 16.5, color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // 하단 뱃지, 리뷰 등 없음
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 하단 Meet 버튼
            Positioned(
              left: 0,
              right: 0,
              bottom: 18,
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MatchRequestPage(
                              userName: name,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                        elevation: 2,
                      ),
                      child: const Text('Meet'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}