import 'package:flutter/foundation.dart';

import '../database/app_database.dart';
import '../models/quiz_question.dart';

class QuizController extends ChangeNotifier {
  List<QuizQuestion> _questions = [];

  int _currentIndex = 0;
  int _score = 0;

  QuizAnswer? _selectedAnswer;

  bool _isLoading = false;
  bool _isFinished = false;

  String? _error;


  // GETTERS


  List<QuizQuestion> get questions => _questions;

  int get currentIndex => _currentIndex;

  int get score => _score;

  int get totalQuestions => _questions.length;

  QuizAnswer? get selectedAnswer => _selectedAnswer;

  bool get isLoading => _isLoading;

  bool get isFinished => _isFinished;

  String? get error => _error;

  bool get hasSelectedAnswer => _selectedAnswer != null;

  bool get hasQuestions => _questions.isNotEmpty;

  bool get isLastQuestion {
    if (_questions.isEmpty) {
      return false;
    }

    return _currentIndex == _questions.length - 1;
  }

  QuizQuestion? get currentQuestion {
    if (_questions.isEmpty) {
      return null;
    }

    if (_currentIndex >= _questions.length) {
      return null;
    }

    return _questions[_currentIndex];
  }

  double get progress {
    if (_questions.isEmpty) {
      return 0;
    }

    return (_currentIndex + 1) / _questions.length;
  }

  double get percentage {
    if (_questions.isEmpty) {
      return 0;
    }

    return (_score / _questions.length) * 100;
  }


  // cargar quiz


  Future<void> loadQuiz(String segment) async {
    _isLoading = true;
    _error = null;

    _currentIndex = 0;
    _score = 0;
    _selectedAnswer = null;
    _isFinished = false;
    _questions = [];

    notifyListeners();

    try {
      final questions = await AppDatabase.instance
          .getQuestionsBySegment(segment);

      _questions = questions;

      // Aunque la BD ya las devuelve mezcladas,
      // podemos asegurar el orden aleatorio.
      _questions.shuffle();

      for (final question in _questions) {
        question.answers.shuffle();
      }

      if (_questions.isEmpty) {
        _error = 'No hay preguntas disponibles para esta categoría.';
      }
    } catch (e) {
      _error = 'Error cargando el quiz: $e';
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }


  // seleccionar respuestas


  void selectAnswer(QuizAnswer answer) {
    // No permitir contestar dos veces la misma pregunta.
    if (_selectedAnswer != null) {
      return;
    }

    _selectedAnswer = answer;

    if (answer.isCorrect) {
      _score++;
    }

    notifyListeners();
  }


  // helpers de las respuestas


  bool isSelectedAnswer(QuizAnswer answer) {
    return _selectedAnswer?.id == answer.id;
  }

  bool isCorrectAnswer(QuizAnswer answer) {
    return answer.isCorrect;
  }

  bool isWrongSelectedAnswer(QuizAnswer answer) {
    return _selectedAnswer?.id == answer.id &&
        !answer.isCorrect;
  }

  QuizAnswer? get correctAnswer {
    final question = currentQuestion;

    if (question == null) {
      return null;
    }

    for (final answer in question.answers) {
      if (answer.isCorrect) {
        return answer;
      }
    }

    return null;
  }


  // siguiente pregunta


  void nextQuestion() {
    // Obligar al usuario a responder antes de continuar.
    if (_selectedAnswer == null) {
      return;
    }

    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;

      _selectedAnswer = null;

      notifyListeners();

      return;
    }

    _isFinished = true;

    notifyListeners();
  }


  // reiniciar quiz


  void restartQuiz() {
    _questions.shuffle();

    for (final question in _questions) {
      question.answers.shuffle();
    }

    _currentIndex = 0;
    _score = 0;
    _selectedAnswer = null;
    _isFinished = false;
    _error = null;

    notifyListeners();
  }


  // reset


  void reset() {
    _questions = [];

    _currentIndex = 0;
    _score = 0;

    _selectedAnswer = null;

    _isLoading = false;
    _isFinished = false;

    _error = null;

    notifyListeners();
  }
}