import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_question.freezed.dart';
part 'quiz_question.g.dart';


bool _boolFromDb(dynamic value) {
  if (value is bool) {
    return value;
  }

  if (value is int) {
    return value == 1;
  }

  return false;
}

int _boolToDb(bool value) {
  return value ? 1 : 0;
}


// Respuestas del QUIZ

@freezed
abstract class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({
    required int id,

    @JsonKey(name: 'question_id')
    required int questionId,

    @JsonKey(name: 'answer_text')
    required String text,

    @JsonKey(
      name: 'is_correct',
      fromJson: _boolFromDb,
      toJson: _boolToDb,
  )
  required bool isCorrect,

}) = _QuizAnswer;

  factory QuizAnswer.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$QuizAnswerFromJson(json);
}

// Preguntas del QUIZ

@freezed
abstract class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required int id,

    @JsonKey(name: 'category_id')
    required int categoryId,

    required String type,

    required String difficulty,

    @JsonKey(name: 'question_text')
    required String text,

    @Default([])
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    List<QuizAnswer> answers,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$QuizQuestionFromJson(json);
}