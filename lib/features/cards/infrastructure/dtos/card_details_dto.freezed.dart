// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardDetailsDto {

 String get id; String get last4; String get brand; String get type; String get holderName; String get expiryDate; String get status; double get dailyLimit; String get currency;
/// Create a copy of CardDetailsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardDetailsDtoCopyWith<CardDetailsDto> get copyWith => _$CardDetailsDtoCopyWithImpl<CardDetailsDto>(this as CardDetailsDto, _$identity);

  /// Serializes this CardDetailsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardDetailsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.type, type) || other.type == type)&&(identical(other.holderName, holderName) || other.holderName == holderName)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,last4,brand,type,holderName,expiryDate,status,dailyLimit,currency);

@override
String toString() {
  return 'CardDetailsDto(id: $id, last4: $last4, brand: $brand, type: $type, holderName: $holderName, expiryDate: $expiryDate, status: $status, dailyLimit: $dailyLimit, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $CardDetailsDtoCopyWith<$Res>  {
  factory $CardDetailsDtoCopyWith(CardDetailsDto value, $Res Function(CardDetailsDto) _then) = _$CardDetailsDtoCopyWithImpl;
@useResult
$Res call({
 String id, String last4, String brand, String type, String holderName, String expiryDate, String status, double dailyLimit, String currency
});




}
/// @nodoc
class _$CardDetailsDtoCopyWithImpl<$Res>
    implements $CardDetailsDtoCopyWith<$Res> {
  _$CardDetailsDtoCopyWithImpl(this._self, this._then);

  final CardDetailsDto _self;
  final $Res Function(CardDetailsDto) _then;

/// Create a copy of CardDetailsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? last4 = null,Object? brand = null,Object? type = null,Object? holderName = null,Object? expiryDate = null,Object? status = null,Object? dailyLimit = null,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,last4: null == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,holderName: null == holderName ? _self.holderName : holderName // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CardDetailsDto].
extension CardDetailsDtoPatterns on CardDetailsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardDetailsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardDetailsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardDetailsDto value)  $default,){
final _that = this;
switch (_that) {
case _CardDetailsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardDetailsDto value)?  $default,){
final _that = this;
switch (_that) {
case _CardDetailsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String last4,  String brand,  String type,  String holderName,  String expiryDate,  String status,  double dailyLimit,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardDetailsDto() when $default != null:
return $default(_that.id,_that.last4,_that.brand,_that.type,_that.holderName,_that.expiryDate,_that.status,_that.dailyLimit,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String last4,  String brand,  String type,  String holderName,  String expiryDate,  String status,  double dailyLimit,  String currency)  $default,) {final _that = this;
switch (_that) {
case _CardDetailsDto():
return $default(_that.id,_that.last4,_that.brand,_that.type,_that.holderName,_that.expiryDate,_that.status,_that.dailyLimit,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String last4,  String brand,  String type,  String holderName,  String expiryDate,  String status,  double dailyLimit,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _CardDetailsDto() when $default != null:
return $default(_that.id,_that.last4,_that.brand,_that.type,_that.holderName,_that.expiryDate,_that.status,_that.dailyLimit,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardDetailsDto extends CardDetailsDto {
  const _CardDetailsDto({required this.id, required this.last4, required this.brand, required this.type, required this.holderName, required this.expiryDate, required this.status, required this.dailyLimit, required this.currency}): super._();
  factory _CardDetailsDto.fromJson(Map<String, dynamic> json) => _$CardDetailsDtoFromJson(json);

@override final  String id;
@override final  String last4;
@override final  String brand;
@override final  String type;
@override final  String holderName;
@override final  String expiryDate;
@override final  String status;
@override final  double dailyLimit;
@override final  String currency;

/// Create a copy of CardDetailsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardDetailsDtoCopyWith<_CardDetailsDto> get copyWith => __$CardDetailsDtoCopyWithImpl<_CardDetailsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardDetailsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardDetailsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.type, type) || other.type == type)&&(identical(other.holderName, holderName) || other.holderName == holderName)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,last4,brand,type,holderName,expiryDate,status,dailyLimit,currency);

@override
String toString() {
  return 'CardDetailsDto(id: $id, last4: $last4, brand: $brand, type: $type, holderName: $holderName, expiryDate: $expiryDate, status: $status, dailyLimit: $dailyLimit, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$CardDetailsDtoCopyWith<$Res> implements $CardDetailsDtoCopyWith<$Res> {
  factory _$CardDetailsDtoCopyWith(_CardDetailsDto value, $Res Function(_CardDetailsDto) _then) = __$CardDetailsDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String last4, String brand, String type, String holderName, String expiryDate, String status, double dailyLimit, String currency
});




}
/// @nodoc
class __$CardDetailsDtoCopyWithImpl<$Res>
    implements _$CardDetailsDtoCopyWith<$Res> {
  __$CardDetailsDtoCopyWithImpl(this._self, this._then);

  final _CardDetailsDto _self;
  final $Res Function(_CardDetailsDto) _then;

/// Create a copy of CardDetailsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? last4 = null,Object? brand = null,Object? type = null,Object? holderName = null,Object? expiryDate = null,Object? status = null,Object? dailyLimit = null,Object? currency = null,}) {
  return _then(_CardDetailsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,last4: null == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,holderName: null == holderName ? _self.holderName : holderName // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
