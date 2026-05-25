// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankCardDto {

 String get id; String get last4; String get brand; String get type;
/// Create a copy of BankCardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankCardDtoCopyWith<BankCardDto> get copyWith => _$BankCardDtoCopyWithImpl<BankCardDto>(this as BankCardDto, _$identity);

  /// Serializes this BankCardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,last4,brand,type);

@override
String toString() {
  return 'BankCardDto(id: $id, last4: $last4, brand: $brand, type: $type)';
}


}

/// @nodoc
abstract mixin class $BankCardDtoCopyWith<$Res>  {
  factory $BankCardDtoCopyWith(BankCardDto value, $Res Function(BankCardDto) _then) = _$BankCardDtoCopyWithImpl;
@useResult
$Res call({
 String id, String last4, String brand, String type
});




}
/// @nodoc
class _$BankCardDtoCopyWithImpl<$Res>
    implements $BankCardDtoCopyWith<$Res> {
  _$BankCardDtoCopyWithImpl(this._self, this._then);

  final BankCardDto _self;
  final $Res Function(BankCardDto) _then;

/// Create a copy of BankCardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? last4 = null,Object? brand = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,last4: null == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BankCardDto].
extension BankCardDtoPatterns on BankCardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankCardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankCardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankCardDto value)  $default,){
final _that = this;
switch (_that) {
case _BankCardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankCardDto value)?  $default,){
final _that = this;
switch (_that) {
case _BankCardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String last4,  String brand,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankCardDto() when $default != null:
return $default(_that.id,_that.last4,_that.brand,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String last4,  String brand,  String type)  $default,) {final _that = this;
switch (_that) {
case _BankCardDto():
return $default(_that.id,_that.last4,_that.brand,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String last4,  String brand,  String type)?  $default,) {final _that = this;
switch (_that) {
case _BankCardDto() when $default != null:
return $default(_that.id,_that.last4,_that.brand,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BankCardDto extends BankCardDto {
  const _BankCardDto({required this.id, required this.last4, required this.brand, required this.type}): super._();
  factory _BankCardDto.fromJson(Map<String, dynamic> json) => _$BankCardDtoFromJson(json);

@override final  String id;
@override final  String last4;
@override final  String brand;
@override final  String type;

/// Create a copy of BankCardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankCardDtoCopyWith<_BankCardDto> get copyWith => __$BankCardDtoCopyWithImpl<_BankCardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankCardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankCardDto&&(identical(other.id, id) || other.id == id)&&(identical(other.last4, last4) || other.last4 == last4)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,last4,brand,type);

@override
String toString() {
  return 'BankCardDto(id: $id, last4: $last4, brand: $brand, type: $type)';
}


}

/// @nodoc
abstract mixin class _$BankCardDtoCopyWith<$Res> implements $BankCardDtoCopyWith<$Res> {
  factory _$BankCardDtoCopyWith(_BankCardDto value, $Res Function(_BankCardDto) _then) = __$BankCardDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String last4, String brand, String type
});




}
/// @nodoc
class __$BankCardDtoCopyWithImpl<$Res>
    implements _$BankCardDtoCopyWith<$Res> {
  __$BankCardDtoCopyWithImpl(this._self, this._then);

  final _BankCardDto _self;
  final $Res Function(_BankCardDto) _then;

/// Create a copy of BankCardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? last4 = null,Object? brand = null,Object? type = null,}) {
  return _then(_BankCardDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,last4: null == last4 ? _self.last4 : last4 // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CardsResponseDto {

 List<BankCardDto> get cards;
/// Create a copy of CardsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardsResponseDtoCopyWith<CardsResponseDto> get copyWith => _$CardsResponseDtoCopyWithImpl<CardsResponseDto>(this as CardsResponseDto, _$identity);

  /// Serializes this CardsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardsResponseDto&&const DeepCollectionEquality().equals(other.cards, cards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cards));

@override
String toString() {
  return 'CardsResponseDto(cards: $cards)';
}


}

/// @nodoc
abstract mixin class $CardsResponseDtoCopyWith<$Res>  {
  factory $CardsResponseDtoCopyWith(CardsResponseDto value, $Res Function(CardsResponseDto) _then) = _$CardsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<BankCardDto> cards
});




}
/// @nodoc
class _$CardsResponseDtoCopyWithImpl<$Res>
    implements $CardsResponseDtoCopyWith<$Res> {
  _$CardsResponseDtoCopyWithImpl(this._self, this._then);

  final CardsResponseDto _self;
  final $Res Function(CardsResponseDto) _then;

/// Create a copy of CardsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cards = null,}) {
  return _then(_self.copyWith(
cards: null == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as List<BankCardDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CardsResponseDto].
extension CardsResponseDtoPatterns on CardsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CardsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CardsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BankCardDto> cards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardsResponseDto() when $default != null:
return $default(_that.cards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BankCardDto> cards)  $default,) {final _that = this;
switch (_that) {
case _CardsResponseDto():
return $default(_that.cards);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BankCardDto> cards)?  $default,) {final _that = this;
switch (_that) {
case _CardsResponseDto() when $default != null:
return $default(_that.cards);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardsResponseDto extends CardsResponseDto {
  const _CardsResponseDto({required final  List<BankCardDto> cards}): _cards = cards,super._();
  factory _CardsResponseDto.fromJson(Map<String, dynamic> json) => _$CardsResponseDtoFromJson(json);

 final  List<BankCardDto> _cards;
@override List<BankCardDto> get cards {
  if (_cards is EqualUnmodifiableListView) return _cards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cards);
}


/// Create a copy of CardsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardsResponseDtoCopyWith<_CardsResponseDto> get copyWith => __$CardsResponseDtoCopyWithImpl<_CardsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardsResponseDto&&const DeepCollectionEquality().equals(other._cards, _cards));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cards));

@override
String toString() {
  return 'CardsResponseDto(cards: $cards)';
}


}

/// @nodoc
abstract mixin class _$CardsResponseDtoCopyWith<$Res> implements $CardsResponseDtoCopyWith<$Res> {
  factory _$CardsResponseDtoCopyWith(_CardsResponseDto value, $Res Function(_CardsResponseDto) _then) = __$CardsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<BankCardDto> cards
});




}
/// @nodoc
class __$CardsResponseDtoCopyWithImpl<$Res>
    implements _$CardsResponseDtoCopyWith<$Res> {
  __$CardsResponseDtoCopyWithImpl(this._self, this._then);

  final _CardsResponseDto _self;
  final $Res Function(_CardsResponseDto) _then;

/// Create a copy of CardsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cards = null,}) {
  return _then(_CardsResponseDto(
cards: null == cards ? _self._cards : cards // ignore: cast_nullable_to_non_nullable
as List<BankCardDto>,
  ));
}


}

// dart format on
