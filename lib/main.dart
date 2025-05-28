import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'login_screen.dart';
import 'map_screen.dart';
import 'match_request_page.dart';
import 'chat_support_end_page.dart';
import 'met_page.dart';
import 'pin_page.dart';
import 'profile_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mannapin',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/map': (context) => const BubbleMapPage(),
        '/match_requst': (context) => const MatchRequestPage(),
        '/pin_page': (context) => const PinPage(),
        '/met_page': (context) => const MetPage(),
        '/chat_support_end_page': (context) => const ChatSupportEndPage(),
      },
      // onGenerateRoute는 마커 클릭 등에서 locationId 등 파라미터 넘길 때 활용
      onGenerateRoute: (settings) {
        if (settings.name == '/profile_list') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ProfileListScreen(locationId: args['locationId']),
          );
        }
        return null;
      },
    );
  }
}