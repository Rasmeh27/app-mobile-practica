// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) => _QuizAnswer(
  id: (json['id'] as num).toInt(),
  questionId: (json['question_id'] as num).toInt(),
  text: json['answer_text'] as String,
  isCorrect: _boolFromDb(json['is_correct']),
);

Map<String, dynamic> _$QuizAnswerToJson(_QuizAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'answer_text': instance.text,
      'is_correct': _boolToDb(instance.isCorrect),
    };

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      id: (json['id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      type: json['type'] as String,
      difficulty: json['difficulty'] as String,
      text: json['question_text'] as String,
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'type': instance.type,
      'difficulty': instance.difficulty,
      'question_text': instance.text,
    };
