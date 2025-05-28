import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _checkLoginAndRedirect(); // 웹에서 로그인 상태 확인
    }
  }

  Future<void> _checkLoginAndRedirect() async {
    final googleUser = await GoogleSignIn().signInSilently();
    if (googleUser != null) {
      Navigator.pushNamed(context, '/map');
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // ✅ 웹은 signInWithPopup 사용
        final googleProvider = GoogleAuthProvider();
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
      } else {
        // ✅ 모바일은 기존 방식
        final googleUser = await GoogleSignIn(
          scopes: ['email'],
          serverClientId: '828165643684-bq381qcc25ad5eqvh4kjoi0pag5km925.apps.googleusercontent.com',
        ).signIn();

        if (googleUser == null) return;

        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      }

      // 로그인 성공 시
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushNamed(context, '/map');
      }
    } catch (e) {
      print('[로그인 실패]: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF87CEEB), // 화면 전체 배경색 설정 (하늘색)
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB), // AppBar 배경도 동일한 색상 적용
        title: const Text('Dolphins'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              //onPressed: _signInWithGoogle,
              onPressed:(){         Navigator.pushNamed(context, '/map');
              }
              ,child: const Text('구글 계정으로 로그인'),
            ),
          ],
        ),
      ),
    );
  }


  Widget _socialButton(String text, Color color, {Color textColor = Colors.white}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/map');
      },
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
