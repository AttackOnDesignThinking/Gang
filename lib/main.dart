import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/login_screen.dart';
import 'screens/map_screen.dart';
import 'screens/match_request_page.dart';
import 'screens/chat_support_end_page.dart';
import 'screens/met_page.dart';
import 'screens/pin_page.dart';
import 'screens/profile_list_screen.dart';
import 'screens/meeting_coordination.dart';

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
        '/pin_page': (context) => const PinPage(),
        '/met_page': (context) => const MetPage(),
        '/chat_support_end_page': (context) => const ChatSupportEndPage(),
        '/meeting_coordination': (context) => const MeetingCoordinationScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/profile_list') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ProfileListScreen(locationId: args['locationId']),
          );
        }
        if (settings.name == '/match_request') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => MatchRequestPage(
              userName: args['userName'] ?? '',
              // placeName 등 추가 파라미터 필요시 여기에
            ),
          );
        }
        return null;
      },
    );
  }
}