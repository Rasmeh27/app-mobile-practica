import 'package:flutter/material.dart';

import 'app/app.dart';
import 'database/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase.instance;

  await database.database;

  final questions = await database.getQuestionCount();
  final answers = await database.getAnswerCount();

  debugPrint('Questions: $questions');
  debugPrint('Answers: $answers');

  runApp(
    const QuizApp(),
  );
}