// lib/widgets/question_card_widget.dart

import 'package:flutter/material.dart';

class QuestionCardWidget extends StatelessWidget {
  final String questionText;

  const QuestionCardWidget({
    Key? key,
    required this.questionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0), // 배경 색상
        borderRadius: BorderRadius.circular(20.0), // 둥근 모서리
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // 그림자
          ),
        ],
      ),
      child: Text(
        questionText,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center, // 텍스트 중앙 정렬
      ),
    );
  }
}