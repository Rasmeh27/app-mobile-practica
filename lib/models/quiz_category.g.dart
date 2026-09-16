// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizCategory _$QuizCategoryFromJson(Map<String, dynamic> json) =>
    _QuizCategory(
      id: (json['id'] as num).toInt(),
      segment: json['segment'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$QuizCategoryToJson(_QuizCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'segment': instance.segment,
      'name': instance.name,
      'description': instance.description,
    };
