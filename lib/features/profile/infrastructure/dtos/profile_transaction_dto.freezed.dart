// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_transaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileTransactionDto {

 String get id; String get title; double get amount; String get date;
/// Create a copy of ProfileTransactionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileTransactionDtoCopyWith<ProfileTransactionDto> get copyWith => _$ProfileTransactionDtoCopyWithImpl<ProfileTransactionDto>(this as ProfileTransactionDto, _$identity);

  /// Serializes this ProfileTransactionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileTransactionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,date);

@override
String toString() {
  return 'ProfileTransactionDto(id: $id, title: $title, amount: $amount, date: $date)';
}


}

/// @nodoc
abstract mixin class $ProfileTransactionDtoCopyWith<$Res>  {
  factory $ProfileTransactionDtoCopyWith(ProfileTransactionDto value, $Res Function(ProfileTransactionDto) _then) = _$ProfileTransactionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, double amount, String date
});




}
/// @nodoc
class _$ProfileTransactionDtoCopyWithImpl<$Res>
    implements $ProfileTransactionDtoCopyWith<$Res> {
  _$ProfileTransactionDtoCopyWithImpl(this._self, this._then);

  final ProfileTransactionDto _self;
  final $Res Function(ProfileTransactionDto) _then;

/// Create a copy of ProfileTransactionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileTransactionDto].
extension ProfileTransactionDtoPatterns on ProfileTransactionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileTransactionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileTransactionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileTransactionDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileTransactionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileTransactionDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileTransactionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  double amount,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileTransactionDto() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  double amount,  String date)  $default,) {final _that = this;
switch (_that) {
case _ProfileTransactionDto():
return $default(_that.id,_that.title,_that.amount,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  double amount,  String date)?  $default,) {final _that = this;
switch (_that) {
case _ProfileTransactionDto() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileTransactionDto extends ProfileTransactionDto {
  const _ProfileTransactionDto({required this.id, required this.title, required this.amount, required this.date}): super._();
  factory _ProfileTransactionDto.fromJson(Map<String, dynamic> json) => _$ProfileTransactionDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  double amount;
@override final  String date;

/// Create a copy of ProfileTransactionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileTransactionDtoCopyWith<_ProfileTransactionDto> get copyWith => __$ProfileTransactionDtoCopyWithImpl<_ProfileTransactionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileTransactionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileTransactionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,date);

@override
String toString() {
  return 'ProfileTransactionDto(id: $id, title: $title, amount: $amount, date: $date)';
}


}

/// @nodoc
abstract mixin class _$ProfileTransactionDtoCopyWith<$Res> implements $ProfileTransactionDtoCopyWith<$Res> {
  factory _$ProfileTransactionDtoCopyWith(_ProfileTransactionDto value, $Res Function(_ProfileTransactionDto) _then) = __$ProfileTransactionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, double amount, String date
});




}
/// @nodoc
class __$ProfileTransactionDtoCopyWithImpl<$Res>
    implements _$ProfileTransactionDtoCopyWith<$Res> {
  __$ProfileTransactionDtoCopyWithImpl(this._self, this._then);

  final _ProfileTransactionDto _self;
  final $Res Function(_ProfileTransactionDto) _then;

/// Create a copy of ProfileTransactionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? date = null,}) {
  return _then(_ProfileTransactionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
