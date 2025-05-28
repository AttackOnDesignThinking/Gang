import 'package:flutter/material.dart';
import 'match_request_page.dart'; // 반드시 import!

class ProfileListScreen extends StatelessWidget {
  final int locationId;

  const ProfileListScreen({super.key, required this.locationId});

  final List<Map<String, dynamic>> sampleProfiles = const [
    {
      'name': '조현',
      'tags': ['#축구', '#축구', '#축구', '#축구'],
    },
    {
      'name': '김경진',
      'tags': ['#축구', '#축구', '#축구', '#축구'],
    },
    {
      'name': '남지민',
      'tags': ['#축구', '#축구', '#축구', '#축구'],
    },
    {
      'name': '조현',
      'tags': ['#축구', '#축구', '#축구', '#축구'],
    },
    {
      'name': '조현',
      'tags': ['#축구', '#축구', '#축구', '#축구'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 실제 데이터 연결 시 locationId에 따라 필터링 가능
    final profiles = sampleProfiles;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Container(
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
                            ElevatedButton(
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
                                backgroundColor: Colors.grey[100],
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
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
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
          );
        },
      ),
    );
  }
}