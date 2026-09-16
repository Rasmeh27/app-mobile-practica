import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/quiz_category.dart';
import '../models/quiz_question.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static Database? _database;


  // Instancia de la BD


  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }


  // Iniciando base de datos


  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join(
      dbPath,
      'quiz_app.db',
    );

    final db = await openDatabase(
      path,
      version: 1,

      onConfigure: (db) async {
        await db.execute(
          'PRAGMA foreign_keys = ON',
        );
      },

      onCreate: (db, version) async {
        await _createTables(db);
      },
    );

    // Se ejecuta también si la base ya existia
    // Los métodos de seed evitan duplicados
    await _seedDatabase(db);

    return db;
  }


  // CREATE TABLES


  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        segment TEXT NOT NULL UNIQUE,
        name TEXT NOT NULL,
        description TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id INTEGER NOT NULL,
        type TEXT NOT NULL,
        difficulty TEXT NOT NULL,
        question_text TEXT NOT NULL,

        FOREIGN KEY(category_id)
          REFERENCES categories(id)
          ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE answers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question_id INTEGER NOT NULL,
        answer_text TEXT NOT NULL,
        is_correct INTEGER NOT NULL DEFAULT 0,

        FOREIGN KEY(question_id)
          REFERENCES questions(id)
          ON DELETE CASCADE
      )
    ''');
  }


  // Database seed


  Future<void> _seedDatabase(Database db) async {
    await _seedCategories(db);

    await _seedQuestionsFromJson(
      db: db,
      segment: 'general',
      assetPath: 'assets/data/general_knowledge.json',
    );

    await _seedQuestionsFromJson(
      db: db,
      segment: 'science',
      assetPath: 'assets/data/science.json',
    );

    await _seedQuestionsFromJson(
      db: db,
      segment: 'history',
      assetPath: 'assets/data/history.json',
    );
  }


  // Categorias


  Future<void> _seedCategories(Database db) async {
    final categories = [
      {
        'segment': 'general',
        'name': 'General Knowledge',
        'description': 'Test your general knowledge',
      },
      {
        'segment': 'science',
        'name': 'Science',
        'description': 'Questions about science and computers',
      },
      {
        'segment': 'history',
        'name': 'History',
        'description': 'Historical events and figures',
      },
    ];

    for (final category in categories) {
      await db.insert(
        'categories',
        category,
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
  }


  // JSON -> SQLITE


  Future<void> _seedQuestionsFromJson({
    required Database db,
    required String segment,
    required String assetPath,
  }) async {

    // Buscar categoría


    final categoryResult = await db.query(
      'categories',
      columns: ['id'],
      where: 'segment = ?',
      whereArgs: [segment],
      limit: 1,
    );

    if (categoryResult.isEmpty) {
      throw Exception(
        'Category "$segment" was not found.',
      );
    }

    final categoryId =
    categoryResult.first['id'] as int;


    // Leer JSON


    final jsonString =
    await rootBundle.loadString(assetPath);

    final jsonData =
    jsonDecode(jsonString) as Map<String, dynamic>;

    final results =
    jsonData['results'] as List<dynamic>?;

    if (results == null) {
      throw Exception(
        'Invalid JSON file: $assetPath. '
            'The "results" property was not found.',
      );
    }


    // Insertar preguntas y respuestas


    await db.transaction((txn) async {
      for (final item in results) {
        final data =
        Map<String, dynamic>.from(
          item as Map,
        );

        final questionText = _decodeHtml(
          data['question'] as String,
        );


        // Evitar pregunta duplicada


        final existingQuestion =
        await txn.query(
          'questions',
          columns: ['id'],
          where:
          'category_id = ? AND question_text = ?',
          whereArgs: [
            categoryId,
            questionText,
          ],
          limit: 1,
        );

        late int questionId;

        if (existingQuestion.isNotEmpty) {
          questionId =
          existingQuestion.first['id'] as int;
        } else {
          questionId = await txn.insert(
            'questions',
            {
              'category_id': categoryId,
              'type': data['type'] ?? 'multiple',
              'difficulty':
              data['difficulty'] ?? 'easy',
              'question_text': questionText,
            },
          );
        }


        // Respuesta correcta


        final correctAnswer = _decodeHtml(
          data['correct_answer'] as String,
        );

        await _insertAnswerIfMissing(
          txn: txn,
          questionId: questionId,
          answerText: correctAnswer,
          isCorrect: true,
        );


        // Respuestas incorrectas


        final incorrectAnswers =
            data['incorrect_answers']
            as List<dynamic>? ??
                [];

        for (final answer
        in incorrectAnswers) {
          await _insertAnswerIfMissing(
            txn: txn,
            questionId: questionId,
            answerText: _decodeHtml(
              answer.toString(),
            ),
            isCorrect: false,
          );
        }
      }
    });
  }


  // Haciendo insert de las respuestas sin duplicados


  Future<void> _insertAnswerIfMissing({
    required Transaction txn,
    required int questionId,
    required String answerText,
    required bool isCorrect,
  }) async {
    final existingAnswer =
    await txn.query(
      'answers',
      columns: ['id'],
      where:
      'question_id = ? AND answer_text = ?',
      whereArgs: [
        questionId,
        answerText,
      ],
      limit: 1,
    );

    if (existingAnswer.isNotEmpty) {
      return;
    }

    await txn.insert(
      'answers',
      {
        'question_id': questionId,
        'answer_text': answerText,
        'is_correct': isCorrect ? 1 : 0,
      },
    );
  }


  // HTML DECODER

  String _decodeHtml(String text) {
    return html_parser
        .parseFragment(text)
        .text ?? ''
        .trim();
  }

  // Obteniendo todas las categorias

  Future<List<QuizCategory>>
  getCategories() async {
    final db = await database;

    final result = await db.query(
      'categories',
      orderBy: 'id ASC',
    );

    return result
        .map(
          (row) => QuizCategory.fromJson(
        Map<String, dynamic>.from(row),
      ),
    )
        .toList();
  }


  // Obtener categorias por segmentos


  Future<QuizCategory?>
  getCategoryBySegment(
      String segment,
      ) async {
    final db = await database;

    final result = await db.query(
      'categories',
      where: 'segment = ?',
      whereArgs: [segment],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return QuizCategory.fromJson(
      Map<String, dynamic>.from(
        result.first,
      ),
    );
  }


  // Obtener preguntas por ID


  Future<List<QuizQuestion>>
  getQuestionsByCategory(
      int categoryId,
      ) async {
    final db = await database;

    final questionRows = await db.query(
      'questions',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );

    final questions = <QuizQuestion>[];

    for (final row in questionRows) {

      // Crear Question con Freezed


      final question =
      QuizQuestion.fromJson(
        Map<String, dynamic>.from(row),
      );


      // Obtener respuestas


      final answerRows = await db.query(
        'answers',
        where: 'question_id = ?',
        whereArgs: [question.id],
      );

      final answers = answerRows
          .map(
            (row) => QuizAnswer.fromJson(
          Map<String, dynamic>.from(row),
        ),
      )
          .toList();

      // Posiciones aleatorias.
      answers.shuffle();


      // Agregar respuestas a Question


      questions.add(
        question.copyWith(
          answers: answers,
        ),
      );
    }

    // Orden aleatorio de preguntas.
    questions.shuffle();

    return questions;
  }


  // Obtener preguntas por segmento


  Future<List<QuizQuestion>>
  getQuestionsBySegment(
      String segment,
      ) async {
    final db = await database;

    final categoryResult = await db.query(
      'categories',
      columns: ['id'],
      where: 'segment = ?',
      whereArgs: [segment],
      limit: 1,
    );

    if (categoryResult.isEmpty) {
      return [];
    }

    final categoryId =
    categoryResult.first['id'] as int;

    return getQuestionsByCategory(
      categoryId,
    );
  }


  // COUNT de las preguntas


  Future<int> getQuestionCount() async {
    final db = await database;

    final result = await db.rawQuery(
      'SELECT COUNT(*) AS total FROM questions',
    );

    return Sqflite.firstIntValue(
      result,
    ) ??
        0;
  }


  // COUNT de las respuestas


  Future<int> getAnswerCount() async {
    final db = await database;

    final result = await db.rawQuery(
      'SELECT COUNT(*) AS total FROM answers',
    );

    return Sqflite.firstIntValue(
      result,
    ) ??
        0;
  }

  // COUNT de las preguntas por categoria

  Future<int> getQuestionCountBySegment(
      String segment,
      ) async {
    final db = await database;

    final result = await db.rawQuery(
      '''
      SELECT COUNT(q.id) AS total
      FROM questions q
      INNER JOIN categories c
        ON c.id = q.category_id
      WHERE c.segment = ?
      ''',
      [segment],
    );

    return Sqflite.firstIntValue(
      result,
    ) ??
        0;
  }


  // CLOSE DATABASE

  Future<void> close() async {
    final db = await database;

    await db.close();

    _database = null;
  }
}