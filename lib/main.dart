import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/landing_page.dart';
import 'package:my_flutter_app/screens/login_page.dart';
import 'package:my_flutter_app/screens/register_page.dart';
import 'package:my_flutter_app/screens/welcome_page.dart';
import 'package:my_flutter_app/screens/chat_page.dart';
import 'package:my_flutter_app/screens/chat_library_page.dart';
import 'package:my_flutter_app/screens/chat_history_page.dart';
import 'package:my_flutter_app/screens/settings_page.dart';
import 'package:my_flutter_app/screens/book_contact_page.dart';
import 'package:my_flutter_app/screens/recommendations_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIWell',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/welcome': (context) => const WelcomePage(),
        '/chat': (context) => const ChatPage(),
        '/chat-library': (context) => const ChatLibraryPage(),
        '/chat-history': (context) => const ChatHistoryPage(),
        '/settings': (context) => const SettingsPage(),
        '/book': (context) => const BookContactPage(),
        '/recommendations': (context) => const RecommendationsPage(),
      },
    );
  }
}
