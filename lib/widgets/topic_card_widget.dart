// lib/widgets/topic_card_widget.dart

import 'package:flutter/material.dart';
import 'package:temp/models/conversation_topics.dart'; // 실제 앱 이름으로 변경해주세요

class TopicCardWidget extends StatefulWidget {
  final ConversationTopic topic;
  final VoidCallback onSavePressed; // 'Save' 버튼 클릭 시 호출될 콜백

  const TopicCardWidget({
    Key? key,
    required this.topic,
    required this.onSavePressed,
  }) : super(key: key);

  @override
  State<TopicCardWidget> createState() => _TopicCardWidgetState();
}

class _TopicCardWidgetState extends State<TopicCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // 아이콘 표시 (Image.asset을 사용하거나, Material Icons 사용)
                // 현재 아이콘은 이미지 에셋으로 보입니다.
                // Image.asset(widget.topic.iconPath, width: 24, height: 24), // 에셋 경로 필요
                Icon(Icons.hiking, color: Colors.blueAccent), // 임시 아이콘
                const SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    widget.topic.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.topic.description,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.bottomRight,
              child: OutlinedButton.icon(
                onPressed: widget.onSavePressed,
                icon: Icon(
                  widget.topic.isSaved ? Icons.bookmark : Icons.bookmark_border,
                  size: 18,
                ),
                label: Text(widget.topic.isSaved ? 'Saved' : 'Save'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: widget.topic.isSaved ? Colors.green : null,
                  side: BorderSide(
                    color: widget.topic.isSaved ? Colors.green : Colors.grey,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
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