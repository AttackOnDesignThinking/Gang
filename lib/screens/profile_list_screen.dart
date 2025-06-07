import 'package:flutter/material.dart';
import 'match_request_page.dart'; // 반드시 import!
import 'profile_detail_screen.dart'; // 프로필 상세 페이지 import

class ProfileListScreen extends StatelessWidget {
  final int locationId;

  const ProfileListScreen({super.key, required this.locationId});

  final List<Map<String, dynamic>> sampleProfiles = const [
    {
      'name': '조현',
      'tags': ['#축구', '#농구'],
      'mannerDepth': 10,
      'bio': '안녕하세요! 스포츠를 사랑하는 조현입니다.',
      'meetingCount': 2,
    },
    {
      'name': '김경진',
      'tags': ['#야구', '#보드게임'],
      'mannerDepth': 5,
      'bio': '취미는 야구 관람과 보드게임입니다.',
      'meetingCount': 7,
    },
    {
      'name': '남지민',
      'tags': ['#등산', '#독서'],
      'mannerDepth': 15,
      'bio': '등산과 독서를 즐기는 남지민입니다.',
      'meetingCount': 0,
    },
    {
      'name': '박수현',
      'tags': ['#요리', '#여행'],
      'mannerDepth': 8,
      'bio': '요리와 여행을 좋아해요.',
      'meetingCount': 11,
    },
    {
      'name': '이정민',
      'tags': ['#음악감상', '#축구'],
      'mannerDepth': 25,
      'bio': '음악과 축구를 사랑하는 이정민입니다.',
      'meetingCount': 18,
    },
    {
      'name': '이서하',
      'tags': ['#사진', '#드라이브'],
      'mannerDepth': 12,
      'bio': '여행하며 사진 찍는 걸 좋아합니다.',
      'meetingCount': 3,
    },
    {
      'name': '김유진',
      'tags': ['#게임', '#요가'],
      'mannerDepth': 7,
      'bio': '게임과 요가로 스트레스를 풀어요.',
      'meetingCount': 5,
    },
    {
      'name': '홍지수',
      'tags': ['#자전거', '#커피'],
      'mannerDepth': 16,
      'bio': '자전거 타고 카페 투어하는 걸 즐깁니다.',
      'meetingCount': 13,
    },
    {
      'name': '박지훈',
      'tags': ['#헬스', '#영화'],
      'mannerDepth': 6,
      'bio': '운동과 영화는 제 인생의 활력소!',
      'meetingCount': 9,
    },
    {
      'name': '최서윤',
      'tags': ['#일러스트', '#독서'],
      'mannerDepth': 3,
      'bio': '그림 그리고 책 읽는 걸 좋아해요.',
      'meetingCount': 1,
    },
    {
      'name': '정민기',
      'tags': ['#베이킹', '#캠핑'],
      'mannerDepth': 14,
      'bio': '달콤한 베이킹과 자연을 좋아합니다.',
      'meetingCount': 6,
    },
    {
      'name': '한지우',
      'tags': ['#러닝', '#플로깅'],
      'mannerDepth': 9,
      'bio': '러닝과 환경을 생각하는 플로깅을 즐깁니다.',
      'meetingCount': 4,
    },
    {
      'name': '윤하은',
      'tags': ['#패션', '#사진'],
      'mannerDepth': 20,
      'bio': '패션과 사진이 제 취미입니다.',
      'meetingCount': 8,
    },
    {
      'name': '오승준',
      'tags': ['#피아노', '#클래식'],
      'mannerDepth': 5,
      'bio': '클래식 음악과 피아노 연주를 좋아해요.',
      'meetingCount': 10,
    },
    {
      'name': '장하늘',
      'tags': ['#스키', '#여행'],
      'mannerDepth': 22,
      'bio': '스키와 여행을 좋아하는 장하늘입니다.',
      'meetingCount': 12,
    },
    {
      'name': '송예린',
      'tags': ['#필라테스', '#요리'],
      'mannerDepth': 17,
      'bio': '건강한 라이프스타일을 추구하고 있어요.',
      'meetingCount': 7,
    },
    {
      'name': '이민재',
      'tags': ['#서핑', '#캠핑'],
      'mannerDepth': 28,
      'bio': '서핑과 캠핑이 제 인생의 낙입니다.',
      'meetingCount': 15,
    },
    {
      'name': '백승아',
      'tags': ['#봉사활동', '#산책'],
      'mannerDepth': 11,
      'bio': '봉사와 산책을 즐기며 하루를 보냅니다.',
      'meetingCount': 2,
    },
    {
      'name': '황지민',
      'tags': ['#클라이밍', '#디자인'],
      'mannerDepth': 4,
      'bio': '클라이밍과 디자인을 사랑하는 황지민입니다.',
      'meetingCount': 3,
    },
    {
      'name': '김태현',
      'tags': ['#마라톤', '#캘리그라피'],
      'mannerDepth': 18,
      'bio': '마라톤과 캘리그라피, 새로운 도전이 좋아요.',
      'meetingCount': 14,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 실제 데이터 연결 시 locationId에 따라 필터링 가능
    final profiles = sampleProfiles;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          '프로필 목록',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return GestureDetector(
            onTap: () {
              // Meet 버튼 이외의 영역 클릭 시에만 이동하도록 구현
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileDetailScreen(
                    profile: profile,
                  ),
                ),
              );
            },
            // IgnorePointer와 Stack을 조합하여 Meet 버튼만 클릭 불가 영역으로 처리
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar
                    Container(
                      width: 54,
                      height: 54,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    const SizedBox(width: 18),
                    // Name, Tags, Meet Button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name & Meet
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                profile['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              // Meet 버튼만 GestureDetector 무효화로 클릭이 ProfileDetail로 전달되지 않게 처리
                              Builder(
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {}, // 이벤트 상쇄 (profile detail로 안 넘어감)
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => MatchRequestPage(
                                              userName: profile['name'],
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF3497FA), // 파란색
                                        elevation: 0,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(11),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 22,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: const Text(
                                        'Meet',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Tags (wraps to next line as needed)
                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            children: List<Widget>.generate(
                              profile['tags'].length,
                                  (tagIdx) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(9),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 1,
                                    )
                                  ],
                                ),
                                child: Text(
                                  profile['tags'][tagIdx],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}