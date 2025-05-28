import 'package:flutter/material.dart';
import 'chat_support_end_page.dart';

class MetPage extends StatelessWidget {
  const MetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text('만났어요', style: TextStyle(color: Color(0xFFBDBDBD))),
        backgroundColor: const Color(0xFFF7F7F7),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '핀을 성공적으로 꼽았어요!\n만났으면 아래 만났어요! 버튼을\n눌러주세요',
              style: TextStyle(color: Colors.black87, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF19C37D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                minimumSize: const Size(135, 44),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ChatSupportEndPage()),
                );
              },
              child: const Text(
                "만났어요!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}