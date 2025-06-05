import 'package:flutter/material.dart';

class ChatSupportEndPage extends StatelessWidget {
  const ChatSupportEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF19C37D);
    const red = Color(0xFFE94E4E);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Color(0xFFBDBDBD))),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 대화보조
            GestureDetector( // <--- GestureDetector로 Container를 감쌉니다.
              onTap: () {
                // '/daily_conversation' 라우트로 이동합니다.
                // pushReplacementNamed를 사용하면 ChatSupportEndPage가 스택에서 제거됩니다.
                // 뒤로가기로 ChatSupportEndPage로 돌아오게 하려면 pushNamed를 사용하세요.
                Navigator.pushReplacementNamed(context, '/daily_conversation');
              },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "대화보조",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          
            const SizedBox(height: 10),
            const Text(
              "이런 주제는 어때요?\n\n"
                  "- 정언명령에 대하여 어떻게 생각하세요?\n"
                  "- 처음 보는 사람과 가장 빨리 친해지는 방법이 무엇이라고 생각하세요?",
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(height: 28),
            // 헤어지기 (탭하면 지도 화면으로!)
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/map');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "헤어지기",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}