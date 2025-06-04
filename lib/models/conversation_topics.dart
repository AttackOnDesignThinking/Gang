// lib/models/conversation_topic.dart

class ConversationTopic {
  final String iconPath; // 아이콘 경로 (예: 'assets/hiking_icon.png')
  final String title;
  final String description;
  bool isSaved; // 저장 여부 (UI 업데이트를 위해 mutable하게 두거나, 상태 관리에서 처리)

  ConversationTopic({
    required this.iconPath,
    required this.title,
    required this.description,
    this.isSaved = false, // 기본값은 저장되지 않음
  });
}