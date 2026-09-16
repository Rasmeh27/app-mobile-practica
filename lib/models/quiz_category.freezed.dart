// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizCategory {

 int get id; String get segment; String get name; String get description;
/// Create a copy of QuizCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizCategoryCopyWith<QuizCategory> get copyWith => _$QuizCategoryCopyWithImpl<QuizCategory>(this as QuizCategory, _$identity);

  /// Serializes this QuizCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizCategory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizCategory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.segment, _this.segment) || other.segment == _this.segment)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizCategory;
  return Object.hash(runtimeType,_this.id,_this.segment,_this.name,_this.description);
}

@override
String toString() {
  final _this = this as QuizCategory;
  return 'QuizCategory(id: ${_this.id}, segment: ${_this.segment}, name: ${_this.name}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $QuizCategoryCopyWith<$Res>  {
  factory $QuizCategoryCopyWith(QuizCategory value, $Res Function(QuizCategory) _then) = _$QuizCategoryCopyWithImpl;
@useResult
$Res call({
 int id, String segment, String name, String description
});




}
/// @nodoc
class _$QuizCategoryCopyWithImpl<$Res>
    implements $QuizCategoryCopyWith<$Res> {
  _$QuizCategoryCopyWithImpl(this._self, this._then);

  final QuizCategory _self;
  final $Res Function(QuizCategory) _then;

/// Create a copy of QuizCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? segment = null,Object? name = null,Object? description = null,}) {
  return _then(QuizCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,segment: null == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizCategory].
extension QuizCategoryPatterns on QuizCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizCategory value)  $default,){
final _that = this;
switch (_that) {
case _QuizCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizCategory value)?  $default,){
final _that = this;
switch (_that) {
case _QuizCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String segment,  String name,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizCategory() when $default != null:
return $default(_that.id,_that.segment,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String segment,  String name,  String description)  $default,) {final _that = this;
switch (_that) {
case _QuizCategory():
return $default(_that.id,_that.segment,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String segment,  String name,  String description)?  $default,) {final _that = this;
switch (_that) {
case _QuizCategory() when $default != null:
return $default(_that.id,_that.segment,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizCategory implements QuizCategory {
  const _QuizCategory({required this.id, required this.segment, required this.name, required this.description});
  factory _QuizCategory.fromJson(Map<String, dynamic> json) => _$QuizCategoryFromJson(json);

@override final  int id;
@override final  String segment;
@override final  String name;
@override final  String description;

/// Create a copy of QuizCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizCategoryCopyWith<_QuizCategory> get copyWith => __$QuizCategoryCopyWithImpl<_QuizCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.segment, segment) || other.segment == segment)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,segment,name,description);
}

@override
String toString() {
    return 'QuizCategory(id: $id, segment: $segment, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$QuizCategoryCopyWith<$Res> implements $QuizCategoryCopyWith<$Res> {
  factory _$QuizCategoryCopyWith(_QuizCategory value, $Res Function(_QuizCategory) _then) = __$QuizCategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String segment, String name, String description
});




}
/// @nodoc
class __$QuizCategoryCopyWithImpl<$Res>
    implements _$QuizCategoryCopyWith<$Res> {
  __$QuizCategoryCopyWithImpl(this._self, this._then);

  final _QuizCategory _self;
  final $Res Function(_QuizCategory) _then;

/// Create a copy of QuizCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? segment = null,Object? name = null,Object? description = null,}) {
  return _then(_QuizCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,segment: null == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
