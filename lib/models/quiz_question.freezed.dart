// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizAnswer {

 int get id;@JsonKey(name: 'question_id') int get questionId;@JsonKey(name: 'answer_text') String get text;@JsonKey(name: 'is_correct', fromJson: _boolFromDb, toJson: _boolToDb) bool get isCorrect;
/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAnswerCopyWith<QuizAnswer> get copyWith => _$QuizAnswerCopyWithImpl<QuizAnswer>(this as QuizAnswer, _$identity);

  /// Serializes this QuizAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizAnswer;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAnswer&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.questionId, _this.questionId) || other.questionId == _this.questionId)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.isCorrect, _this.isCorrect) || other.isCorrect == _this.isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizAnswer;
  return Object.hash(runtimeType,_this.id,_this.questionId,_this.text,_this.isCorrect);
}

@override
String toString() {
  final _this = this as QuizAnswer;
  return 'QuizAnswer(id: ${_this.id}, questionId: ${_this.questionId}, text: ${_this.text}, isCorrect: ${_this.isCorrect})';
}


}

/// @nodoc
abstract mixin class $QuizAnswerCopyWith<$Res>  {
  factory $QuizAnswerCopyWith(QuizAnswer value, $Res Function(QuizAnswer) _then) = _$QuizAnswerCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'question_id') int questionId,@JsonKey(name: 'answer_text') String text,@JsonKey(name: 'is_correct', fromJson: _boolFromDb, toJson: _boolToDb) bool isCorrect
});




}
/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res>
    implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._self, this._then);

  final QuizAnswer _self;
  final $Res Function(QuizAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? questionId = null,Object? text = null,Object? isCorrect = null,}) {
  return _then(QuizAnswer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAnswer].
extension QuizAnswerPatterns on QuizAnswer {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAnswer value)  $default,){
final _that = this;
switch (_that) {
case _QuizAnswer():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'question_id')  int questionId, @JsonKey(name: 'answer_text')  String text, @JsonKey(name: 'is_correct', fromJson: _boolFromDb, toJson: _boolToDb)  bool isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
return $default(_that.id,_that.questionId,_that.text,_that.isCorrect);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'question_id')  int questionId, @JsonKey(name: 'answer_text')  String text, @JsonKey(name: 'is_correct', fromJson: _boolFromDb, toJson: _boolToDb)  bool isCorrect)  $default,) {final _that = this;
switch (_that) {
case _QuizAnswer():
return $default(_that.id,_that.questionId,_that.text,_that.isCorrect);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'question_id')  int questionId, @JsonKey(name: 'answer_text')  String text, @JsonKey(name: 'is_correct', fromJson: _boolFromDb, toJson: _boolToDb)  bool isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
return $default(_that.id,_that.questionId,_that.text,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizAnswer implements QuizAnswer {
  const _QuizAnswer({required this.id, @JsonKey(name: 'question_id') required this.questionId, @JsonKey(name: 'answer_text') required this.text, @JsonKey(name: 'is_correct', fromJson: _boolFromDb, toJson: _boolToDb) required this.isCorrect});
  factory _QuizAnswer.fromJson(Map<String, dynamic> json) => _$QuizAnswerFromJson(json);

@override final  int id;
@override@JsonKey(name: 'question_id') final  int questionId;
@override@JsonKey(name: 'answer_text') final  String text;
@override@JsonKey(name: 'is_correct', fromJson: _boolFromDb, toJson: _boolToDb) final  bool isCorrect;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAnswerCopyWith<_QuizAnswer> get copyWith => __$QuizAnswerCopyWithImpl<_QuizAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAnswer&&(identical(other.id, id) || other.id == id)&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.text, text) || other.text == text)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,questionId,text,isCorrect);
}

@override
String toString() {
    return 'QuizAnswer(id: $id, questionId: $questionId, text: $text, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$QuizAnswerCopyWith<$Res> implements $QuizAnswerCopyWith<$Res> {
  factory _$QuizAnswerCopyWith(_QuizAnswer value, $Res Function(_QuizAnswer) _then) = __$QuizAnswerCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'question_id') int questionId,@JsonKey(name: 'answer_text') String text,@JsonKey(name: 'is_correct', fromJson: _boolFromDb, toJson: _boolToDb) bool isCorrect
});




}
/// @nodoc
class __$QuizAnswerCopyWithImpl<$Res>
    implements _$QuizAnswerCopyWith<$Res> {
  __$QuizAnswerCopyWithImpl(this._self, this._then);

  final _QuizAnswer _self;
  final $Res Function(_QuizAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? questionId = null,Object? text = null,Object? isCorrect = null,}) {
  return _then(_QuizAnswer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$QuizQuestion {

 int get id;@JsonKey(name: 'category_id') int get categoryId; String get type; String get difficulty;@JsonKey(name: 'question_text') String get text;@JsonKey(includeFromJson: false, includeToJson: false) List<QuizAnswer> get answers;
/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQuestionCopyWith<QuizQuestion> get copyWith => _$QuizQuestionCopyWithImpl<QuizQuestion>(this as QuizQuestion, _$identity);

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizQuestion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQuestion&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.text, _this.text) || other.text == _this.text)&&const DeepCollectionEquality().equals(other.answers, _this.answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizQuestion;
  return Object.hash(runtimeType,_this.id,_this.categoryId,_this.type,_this.difficulty,_this.text,const DeepCollectionEquality().hash(_this.answers));
}

@override
String toString() {
  final _this = this as QuizQuestion;
  return 'QuizQuestion(id: ${_this.id}, categoryId: ${_this.categoryId}, type: ${_this.type}, difficulty: ${_this.difficulty}, text: ${_this.text}, answers: ${_this.answers})';
}


}

/// @nodoc
abstract mixin class $QuizQuestionCopyWith<$Res>  {
  factory $QuizQuestionCopyWith(QuizQuestion value, $Res Function(QuizQuestion) _then) = _$QuizQuestionCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'category_id') int categoryId, String type, String difficulty,@JsonKey(name: 'question_text') String text,@JsonKey(includeFromJson: false, includeToJson: false) List<QuizAnswer> answers
});




}
/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._self, this._then);

  final QuizQuestion _self;
  final $Res Function(QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? type = null,Object? difficulty = null,Object? text = null,Object? answers = null,}) {
  return _then(QuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<QuizAnswer>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQuestion].
extension QuizQuestionPatterns on QuizQuestion {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizQuestion value)  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'category_id')  int categoryId,  String type,  String difficulty, @JsonKey(name: 'question_text')  String text, @JsonKey(includeFromJson: false, includeToJson: false)  List<QuizAnswer> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.categoryId,_that.type,_that.difficulty,_that.text,_that.answers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'category_id')  int categoryId,  String type,  String difficulty, @JsonKey(name: 'question_text')  String text, @JsonKey(includeFromJson: false, includeToJson: false)  List<QuizAnswer> answers)  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion():
return $default(_that.id,_that.categoryId,_that.type,_that.difficulty,_that.text,_that.answers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'category_id')  int categoryId,  String type,  String difficulty, @JsonKey(name: 'question_text')  String text, @JsonKey(includeFromJson: false, includeToJson: false)  List<QuizAnswer> answers)?  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.categoryId,_that.type,_that.difficulty,_that.text,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizQuestion implements QuizQuestion {
  const _QuizQuestion({required this.id, @JsonKey(name: 'category_id') required this.categoryId, required this.type, required this.difficulty, @JsonKey(name: 'question_text') required this.text, @JsonKey(includeFromJson: false, includeToJson: false)  List<QuizAnswer> answers = const []}): _answers = answers;
  factory _QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);

@override final  int id;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override final  String type;
@override final  String difficulty;
@override@JsonKey(name: 'question_text') final  String text;
 final  List<QuizAnswer> _answers;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<QuizAnswer> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizQuestionCopyWith<_QuizQuestion> get copyWith => __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.type, type) || other.type == type)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,categoryId,type,difficulty,text,const DeepCollectionEquality().hash(_answers));
}

@override
String toString() {
    return 'QuizQuestion(id: $id, categoryId: $categoryId, type: $type, difficulty: $difficulty, text: $text, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$QuizQuestionCopyWith<$Res> implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(_QuizQuestion value, $Res Function(_QuizQuestion) _then) = __$QuizQuestionCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'category_id') int categoryId, String type, String difficulty,@JsonKey(name: 'question_text') String text,@JsonKey(includeFromJson: false, includeToJson: false) List<QuizAnswer> answers
});




}
/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(this._self, this._then);

  final _QuizQuestion _self;
  final $Res Function(_QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? type = null,Object? difficulty = null,Object? text = null,Object? answers = null,}) {
  return _then(_QuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<QuizAnswer>,
  ));
}


}

// dart format on
