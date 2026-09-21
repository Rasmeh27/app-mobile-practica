import 'package:flutter/foundation.dart';

import '../database/app_database.dart';
import '../models/quiz_question.dart';

class QuizController extends ChangeNotifier {
  List<QuizQuestion> _questions = [];
  List<QuizQuestion> _allQuestions = [];

  // Respuesta actualmente seleccionada por el usuario.
  final Map<int, QuizAnswer> _selectedAnswers = {};

  // Respuestas ya confirmadas pulsando Next.
  final Map<int, QuizAnswer> _submittedAnswers = {};

  int _currentIndex = 0;

  bool _isLoading = false;
  bool _isFinished = false;

  String? _error;

  // Dificultad actual.
  String? _currentDifficulty;

  List<QuizQuestion> get questions => _questions;

  int get currentIndex => _currentIndex;

  int get totalQuestions => _questions.length;

  bool get isLoading => _isLoading;

  bool get isFinished => _isFinished;

  String? get error => _error;

  String? get currentDifficulty => _currentDifficulty;

  bool get hasQuestions => _questions.isNotEmpty;

  bool get isFirstQuestion => _currentIndex == 0;

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

    if (_currentIndex < 0 || _currentIndex >= _questions.length) {
      return null;
    }

    return _questions[_currentIndex];
  }

  QuizAnswer? get selectedAnswer {
    final question = currentQuestion;

    if (question == null) {
      return null;
    }

    return _selectedAnswers[question.id];
  }

  bool get hasSelectedAnswer => selectedAnswer != null;

  // El score solo cuenta respuestas confirmadas con Next.
  int get score {
    return _submittedAnswers.values
        .where(
          (answer) => answer.isCorrect,
    )
        .length;
  }

  int get wrongAnswers {
    return _submittedAnswers.values
        .where(
          (answer) => !answer.isCorrect,
    )
        .length;
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

    return (score / _questions.length) * 100;
  }

  Future<void> loadQuiz(String segment) async {
    _isLoading = true;
    _isFinished = false;
    _error = null;

    _currentIndex = 0;

    _questions = [];
    _allQuestions = [];

    _selectedAnswers.clear();
    _submittedAnswers.clear();

    notifyListeners();

    try {
      final questions =
      await AppDatabase.instance.getQuestionsBySegment(
        segment,
      );

      _allQuestions = List<QuizQuestion>.from(
        questions,
      );

      if (_allQuestions.isEmpty) {
        _error = 'No questions available for this category.';
      }
    } catch (e) {
      _error = 'Error loading quiz: $e';
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }

  void filterByDifficulty(String difficulty) {
    _currentDifficulty = difficulty;

    // Buscar todas las preguntas de la dificultad seleccionada.
    final filteredQuestions = _allQuestions
        .where(
          (question) =>
      question.difficulty.toLowerCase() ==
          difficulty.toLowerCase(),
    )
        .toList();

    // Mezclarlas para que cada partida sea distinta.
    filteredQuestions.shuffle();

    // IMPORTANTE:
    // Aunque existan 30 preguntas,
    // el jugador solo responde 10 por partida.
    _questions = filteredQuestions.take(10).toList();

    // También mezclamos el orden de las respuestas
    // para que la correcta no aparezca siempre en la misma posición.
    _questions = _questions.map((question) {
      final shuffledAnswers = List<QuizAnswer>.from(
        question.answers,
      );

      shuffledAnswers.shuffle();

      return question.copyWith(
        answers: shuffledAnswers,
      );
    }).toList();

    _currentIndex = 0;
    _isFinished = false;

    _selectedAnswers.clear();
    _submittedAnswers.clear();

    if (_questions.isEmpty) {
      _error = 'No $difficulty questions available.';
    } else {
      _error = null;
    }

    notifyListeners();
  }

  // Seleccionar una respuesta NO modifica el score.
  void selectAnswer(QuizAnswer answer) {
    final question = currentQuestion;

    if (question == null) {
      return;
    }

    _selectedAnswers[question.id] = answer;

    notifyListeners();
  }

  bool isSelectedAnswer(QuizAnswer answer) {
    return selectedAnswer?.id == answer.id;
  }

  // Devuelve la respuesta confirmada para una pregunta.
  QuizAnswer? selectedAnswerForQuestion(
      QuizQuestion question,
      ) {
    return _submittedAnswers[question.id];
  }

  QuizAnswer? correctAnswerForQuestion(
      QuizQuestion question,
      ) {
    for (final answer in question.answers) {
      if (answer.isCorrect) {
        return answer;
      }
    }

    return null;
  }

  bool isQuestionCorrect(
      QuizQuestion question,
      ) {
    final answer = _submittedAnswers[question.id];

    if (answer == null) {
      return false;
    }

    return answer.isCorrect;
  }

  void nextQuestion() {
    final question = currentQuestion;
    final answer = selectedAnswer;

    if (question == null || answer == null) {
      return;
    }

    // La respuesta se confirma SOLO al presionar Next.
    _submittedAnswers[question.id] = answer;

    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;

      notifyListeners();

      return;
    }

    // Última pregunta.
    _isFinished = true;

    notifyListeners();
  }

  void previousQuestion() {
    if (_currentIndex <= 0) {
      return;
    }

    _currentIndex--;

    notifyListeners();
  }

  void restartQuiz() {
    if (_currentDifficulty == null) {
      return;
    }

    // Volvemos a sacar 10 nuevas preguntas
    // de las 30 disponibles de esa dificultad.
    final filteredQuestions = _allQuestions
        .where(
          (question) =>
      question.difficulty.toLowerCase() ==
          _currentDifficulty!.toLowerCase(),
    )
        .toList();

    filteredQuestions.shuffle();

    _questions = filteredQuestions.take(10).toList();

    // Mezclar también las respuestas.
    _questions = _questions.map((question) {
      final shuffledAnswers = List<QuizAnswer>.from(
        question.answers,
      );

      shuffledAnswers.shuffle();

      return question.copyWith(
        answers: shuffledAnswers,
      );
    }).toList();

    _selectedAnswers.clear();
    _submittedAnswers.clear();

    _currentIndex = 0;

    _isFinished = false;
    _error = null;

    notifyListeners();
  }

  void reset() {
    _questions = [];
    _allQuestions = [];

    _selectedAnswers.clear();
    _submittedAnswers.clear();

    _currentIndex = 0;

    _isLoading = false;
    _isFinished = false;

    _currentDifficulty = null;
    _error = null;

    notifyListeners();
  }
}