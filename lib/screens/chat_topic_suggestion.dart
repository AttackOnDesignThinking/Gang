import 'dart:math';
import 'package:flutter/material.dart';

// chat_support_end_page.dart 파일에서 ChatSupportEndPage를 import하세요!
import 'chat_support_end_page.dart';

class ChatTopicSuggestionPage extends StatefulWidget {
  const ChatTopicSuggestionPage({super.key});

  @override
  State<ChatTopicSuggestionPage> createState() => _ChatTopicSuggestionPageState();
}

class _ChatTopicSuggestionPageState extends State<ChatTopicSuggestionPage> {
  // 추천 대화 주제 리스트 (20개 이상)
  final List<String> _topics = [
    "제일 가고 싶은 여행지는 어디인가요?",
    "요즘 내가 가장 빠져있는 것은?",
    "나를 웃게 한 최근의 순간은?",
    "어릴 때 꿈은 무엇이었나요?",
    "최근에 본 인상 깊은 영화나 드라마는?",
    "어릴 때 가장 좋아했던 음식은?",
    "요즘 배우고 싶은 것이 있다면?",
    "스트레스를 푸는 나만의 방법은?",
    "가장 기억에 남는 생일은 언제였나요?",
    "언젠가 꼭 해보고 싶은 도전이 있다면?",
    "친구들에게 자주 듣는 말은?",
    "최근에 읽은 책 중 추천할 만한 책은?",
    "내가 좋아하는 계절과 그 이유는?",
    "가장 가까운 친구와의 추억 한 가지를 말해본다면?",
    "내가 생각하는 최고의 하루는 어떤 날일까요?",
    "아침에 일어나서 제일 먼저 하는 일은?",
    "인생에서 가장 감사했던 순간은?",
    "지금 당장 떠날 수 있다면 어디로 가고 싶나요?",
    "요즘 나의 소확행(작은 행복)은 무엇인가요?",
    "내가 좋아하는 음악 장르는?",
    "내가 자주 가는 카페나 맛집이 있다면?",
    "나에게 힘을 주는 한 마디가 있다면?",
    "미래에 꼭 이루고 싶은 목표는?",
    "최근에 새롭게 시작한 취미가 있나요?",
  ];

  final Random _random = Random();
  List<String> _currentTopics = [];

  @override
  void initState() {
    super.initState();
    _pickRandomTopics();
  }

  void _pickRandomTopics() {
    final topics = List<String>.from(_topics);
    topics.shuffle(_random);
    setState(() {
      _currentTopics = topics.take(3).toList();
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
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.deepPurple),
          onPressed: () => _goToChatSupportEndPage(context),
        ),

        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          width: 380, // 기존 320 → 380으로 박스 폭 키움
          padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 26), // 기존보다 세로/가로 padding 키움
          decoration: BoxDecoration(
            border: Border.all(color: Colors.purple.shade200, width: 2),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Icon(Icons.chat_bubble_outline, color: Colors.black87, size: 32),
              const SizedBox(height: 15),
              const Text(
                "오늘의 대화\n시작해볼까요?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 26),
              ..._currentTopics.map((q) => Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
                  ],
                ),
                child: Text(
                  q,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                ),
              )),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _pickRandomTopics,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3687FB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  minimumSize: const Size.fromHeight(48),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                icon: const Icon(Icons.refresh, size: 22),
                label: const Text(
                  "새로운 질문",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => _goToChatSupportEndPage(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  minimumSize: const Size.fromHeight(46),
                  side: const BorderSide(color: Color(0xFFD1C4E9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Text(
                  "뒤로 가기",
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}