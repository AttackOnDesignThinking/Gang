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
        title: const Text('대화 보조 및 헤어지기', style: TextStyle(color: Color(0xFFBDBDBD))),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 대화보조
            Container(
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
            const SizedBox(height: 10),
            const Text(
              "이런 주제는 어때요?\n\n"
              "- 정언명령에 대하여 어떻게 생각하세요?\n"
              "- 처음 보는 사람과 가장 빨리 친해지는 방법이 무엇이라고 생각하세요?",
              style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(height: 28),
            // 헤어지기
            Container(
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
            const SizedBox(height: 10),
            
          ],
        ),
      ),
    );
  }
}