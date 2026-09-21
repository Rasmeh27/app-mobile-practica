import 'package:flutter/material.dart';

import '../features/splash/splash_screen.dart';
import 'app_theme.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Master',
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}