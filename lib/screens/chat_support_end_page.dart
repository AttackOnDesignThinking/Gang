import 'package:flutter/material.dart';
import 'recommend_activity_page.dart'; // 추가: 추천활동 페이지 import

class ChatSupportEndPage extends StatelessWidget {
  const ChatSupportEndPage({super.key});

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF3687FB);
    const red = Color(0xFFE94E4E);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(''),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 추천활동 버튼
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RecommendActivityPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  minimumSize: const Size.fromHeight(44),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('추천활동'),
              ),
              const SizedBox(height: 18),
              // 대화보조 버튼
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/chat_topic_suggestion');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  minimumSize: const Size.fromHeight(44),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('대화보조'),
              ),
              const SizedBox(height: 18),
              // 헤어지기 버튼
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/map_screen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  minimumSize: const Size.fromHeight(44),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('헤어지기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}