import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const OnlineCourseApp());
}

class OnlineCourseApp extends StatelessWidget {
  const OnlineCourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LearnHub',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5B5FEF),
        ),
      ),
      home: const LoginPage(),
    );
  }
}