import 'package:flutter/material.dart';

import 'database/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase.instance;

  await database.database;

  final questions =
  await database.getQuestionCount();

  final answers =
  await database.getAnswerCount();

  debugPrint('Questions: $questions');
  debugPrint('Answers: $answers');

  runApp(
    const QuizApp(),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Quiz App',
          ),
        ),
      ),
    );
  }
}