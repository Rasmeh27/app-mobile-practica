import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_category.freezed.dart';
part 'quiz_category.g.dart';

@freezed
abstract class QuizCategory with _$QuizCategory {
  const factory QuizCategory({
    required int id,
    required String segment,
    required String name,
    required String description,
  }) = _QuizCategory;

  factory QuizCategory.fromJson(Map<String, dynamic> json) =>
      _$QuizCategoryFromJson(json);
}