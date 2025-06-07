import 'dart:math';
import 'package:flutter/material.dart';
import 'chat_support_end_page.dart';

class RecommendActivityPage extends StatefulWidget {
  const RecommendActivityPage({super.key});

  @override
  State<RecommendActivityPage> createState() => _RecommendActivityPageState();
}

class _RecommendActivityPageState extends State<RecommendActivityPage> {
  final List<String> _allActivities = [
    "한강가서 돗자리 펴고\n한강라면 먹기",
    "자전거 or 킥보드\n같이 타기",
    "무작정 버스타고\n랜덤으로 내려서 구경하기",
    "근처 공원 산책하기",
    "동네 핫플 카페 가보기",
    "맛집 찾아가서 같이 먹기",
    "사진 찍으러 출사 가기",
    "동물원/식물원 산책하기",
    "전시회, 박람회 관람",
    "보드게임/방탈출 가기",
    "근처 뚝섬 유원지 산책",
    "플로깅(조깅하며 쓰레기 줍기)",
    "방문한 적 없는 지하철역에서 산책하기",
    "야외 벤치에서 커피 마시기",
    "근처 시장 구경하며 먹거리 탐방",
    "피크닉 도시락 싸오기",
    "야간 드라이브",
    "도서관/책방 데이트",
    "근처 산 올라가기",
    "버스킹/공연 관람",
  ];

  final Random _random = Random();
  List<String> _currentActivities = [];

  @override
  void initState() {
    super.initState();
    _pickRandomActivities();
  }

  void _pickRandomActivities() {
    final activities = List<String>.from(_allActivities);
    activities.shuffle(_random);
    setState(() {
      _currentActivities = activities.take(3).toList();
    });
  }

  void _goToChatSupportEndPage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const ChatSupportEndPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF3497FA)),
          onPressed: () => _goToChatSupportEndPage(context),
        ),
        title: const Text(""),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          width: 380,
          padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 26),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade200, width: 2),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 상단 아이콘과 타이틀
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.directions_run, color: Colors.black, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "가볍게\n함께 시작해요",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                      height: 1.15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ..._currentActivities.map((activity) => Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F8),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  activity,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                ),
              )),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _pickRandomActivities,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3497FA),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  minimumSize: const Size.fromHeight(48),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: const Icon(Icons.refresh, size: 22),
                label: const Text(
                  "새로운 활동",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => _goToChatSupportEndPage(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  minimumSize: const Size.fromHeight(46),
                  side: const BorderSide(color: Color(0xFFE0E0E0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Text(
                  "뒤로 가기",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}