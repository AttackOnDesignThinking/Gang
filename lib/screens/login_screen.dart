import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToMapScreen() {
      Navigator.pushReplacementNamed(context, '/map_screen');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 돌고래 로고 (배경 흰색, 크기 크게)
              Container(
                width: 450,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.asset(
                    'lib/assets/logo.png', // 경로를 lib/assets로 수정
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Google 로그인 버튼
              SizedBox(
                width: 270,
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: goToMapScreen,
                  icon: Image.asset(
                    'lib/assets/google_logo.png', // 경로를 lib/assets로 수정
                    width: 22,
                    height: 22,
                  ),
                  label: const Text(
                    'Google 로 시작하기',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFDDDDDD)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 12),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Naver 로그인 버튼
              SizedBox(
                width: 270,
                height: 44,
                child: ElevatedButton.icon(
                  onPressed: goToMapScreen,
                  icon: Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'N',
                      style: TextStyle(
                        color: Color(0xFF03C75A),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                  label: const Text(
                    'Naver 로 시작하기',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF03C75A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 12),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Kakao 로그인 버튼
              SizedBox(
                width: 270,
                height: 44,
                child: ElevatedButton.icon(
                  onPressed: goToMapScreen,
                  icon: Image.asset(
                    'lib/assets/kakao_logo.png', // 경로를 lib/assets로 수정
                    width: 22,
                    height: 22,
                  ),
                  label: const Text(
                    '카카오로 시작하기',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3C1E1E),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE812),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 12),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}