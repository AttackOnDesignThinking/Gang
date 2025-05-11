import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // 방금 생성된 파일
import 'package:flutter/material.dart'; // Flutter Material 디자인 사용 시

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main() 함수에서 async 사용 시 필요
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp()); // 앱 시작 위젯
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mannapin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/map': (context) => MapScreen(),
      },
    );
  }
}

