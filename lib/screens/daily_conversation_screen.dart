// lib/screens/daily_conversation_screen.dart

import 'package:flutter/material.dart';
import 'dart:math'; // <--- 이 줄을 추가합니다.
import 'package:temp/models/question.dart';
import 'package:temp/widgets/question_card_widget.dart';

class DailyConversationScreen extends StatefulWidget {
  const DailyConversationScreen({Key? key}) : super(key: key);

  @override
  State<DailyConversationScreen> createState() => _DailyConversationScreenState();
}

class _DailyConversationScreenState extends State<DailyConversationScreen> {
  // 앱 내에서 사용할 모든 질문 리스트
  final List<Question> _allQuestions = [
    Question(text: "요즘 가장 자주 듣는 노래는 뭐예요?"),
    Question(text: "최근에 기분 좋았던 순간은 언제였나요?"),
    Question(text: "혼자만 알고 있는 작은 행복이 있나요?"),
    Question(text: "요즘 마음을 사로잡은 관심사는 뭐예요?"),
    Question(text: "최근에 인상 깊게 본 영화나 책이 있나요?"),
    Question(text: "가보고 싶은 여행지는 어디인가요?"),
    Question(text: "오늘 하루 중 가장 좋았던 일은 뭐였나요?"),
    Question(text: "어릴 때 꿈꾸던 어른의 모습은 어땠어요?"),
    Question(text: "지친 날, 스스로를 위로하는 방법이 있나요?"),
    Question(text: "친구에게 자주 듣는 말이 있나요?"),
    Question(text: "자신만의 아지트나 쉼터가 있나요?"),
    Question(text: "가장 좋아하는 계절과 그 이유는요?"),
    Question(text: "평소에 자주 떠오르는 생각이나 질문이 있나요?"),
    Question(text: "요즘 가장 고마운 사람은 누구예요?"),
    Question(text: "최근에 웃음을 준 작은 일은 뭐였나요?"),
    Question(text: "시간이 날 때 꼭 하고 싶은 일이 있나요?"),
    Question(text: "어릴 때 자주 듣던 이야기가 있다면요?"),
    Question(text: "스스로에게 자주 해주는 말이 있나요?"),
    Question(text: "좋아하는 냄새나 향이 있나요?"),
    Question(text: "아침에 눈을 뜨고 가장 먼저 떠오르는 생각은요?"),
  ];

  // 현재 화면에 표시될 질문 리스트 (초기에는 비어있음)
  List<Question> _displayedQuestions = [];

  // 난수 생성기
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _generateRandomQuestions(); // 화면이 처음 로드될 때 3개의 질문 생성
  }

  // 새로운 질문을 랜덤으로 선택하여 _displayedQuestions에 할당하는 함수
  void _generateRandomQuestions() {
    if (_allQuestions.length < 3) {
      // 질문이 3개 미만일 경우 처리
      _displayedQuestions = List.from(_allQuestions);
      return;
    }

    // 중복되지 않는 3개의 질문을 선택
    final Set<int> chosenIndices = {}; // 선택된 인덱스를 저장하여 중복 방지
    while (chosenIndices.length < 3) {
      chosenIndices.add(_random.nextInt(_allQuestions.length)); // 0부터 _allQuestions.length-1 까지의 난수 생성
    }

    setState(() {
      _displayedQuestions = chosenIndices.map((index) => _allQuestions[index]).toList();
    });
  }

  // "새로운 질문" 버튼 클릭 시 호출될 함수
  void _getNewQuestions() {
    _generateRandomQuestions(); // 랜덤 질문 다시 생성
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('새로운 질문을 가져왔습니다!'),
        duration: Duration(seconds: 0),
      ),
    );
  }

  // "처음으로 돌아가기" 버튼 클릭 시 호출될 함수 (이전과 동일)
  void _goToBeginning() {
    Navigator.pushReplacementNamed(context, '/map'); // 로그인 화면으로 돌아간다고 가정
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('지도 화면으로 돌아갑니다.'),
        duration: Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.chat_bubble_outline, size: 28, color: Colors.black87),
                  const SizedBox(width: 8),
                  Text(
                    '오늘의 대화\n시작해볼까요?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _displayedQuestions.length, // <--- _displayedQuestions를 사용합니다.
                itemBuilder: (context, index) {
                  return QuestionCardWidget(
                    questionText: _displayedQuestions[index].text, // <--- _displayedQuestions를 사용합니다.
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: _getNewQuestions, // <--- 새로운 질문 가져오기 함수 연결
                  icon: const Icon(Icons.refresh, color: Colors.blueAccent),
                  label: const Text(
                    '새로운 질문',
                    style: TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3F2FD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _goToBeginning,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF0F0F0),
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    '처음으로 돌아가기',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}