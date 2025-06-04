// lib/screens/meeting_coordination_screen.dart

import 'package:flutter/material.dart';
import 'package:temp/models/conversation_topics.dart';
import 'package:temp/widgets/topic_card_widget.dart';

class MeetingCoordinationScreen extends StatefulWidget {
  const MeetingCoordinationScreen({Key? key}) : super(key: key);

  @override
  State<MeetingCoordinationScreen> createState() => _MeetingCoordinationScreenState();
}

class _MeetingCoordinationScreenState extends State<MeetingCoordinationScreen> {
  // 실제 앱에서는 이 데이터를 API에서 가져오거나 상태 관리로 공급받습니다.
  List<ConversationTopic> topics = [
    ConversationTopic(
      iconPath: 'assets/hiking_icon.png', // 실제 에셋 경로로 변경
      title: 'Favorite Hiking Trails',
      description: 'What are some of your favorite hiking trails around here? Have you discovered any hidden gems?',
    ),
    ConversationTopic(
      iconPath: 'assets/travel_icon.png', // 실제 에셋 경로로 변경
      title: 'Travel Bucket List',
      description: 'What are the top three places on your travel bucket list and why?',
    ),
    ConversationTopic(
      iconPath: 'assets/food_icon.png', // 실제 에셋 경로로 변경
      title: 'Local Food Recommendations',
      description: 'Do you have any favorite local restaurants or dishes that you\'d recommend trying?',
    ),
  ];

  void _toggleSaveStatus(int index) {
    setState(() {
      topics[index].isSaved = !topics[index].isSaved;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(topics[index].isSaved ? 'Topic saved!' : 'Topic unsaved!'),
          duration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  void _onWeveMetPressed() {
    // 'We've Met!' 버튼 클릭 시 동작 정의
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('We\'ve Met! button pressed!')),
    );
    // 예: 다른 화면으로 이동, 데이터 전송 등
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 버튼 동작
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Meeting Coordination',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.wifi), // Wi-Fi 아이콘 (예시)
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              'Conversation Topics',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'AI-generated topics based on your shared interests',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return TopicCardWidget(
                  topic: topics[index],
                  onSavePressed: () => _toggleSaveStatus(index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: _onWeveMetPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // 초록색 버튼
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'We\'ve Met!',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}