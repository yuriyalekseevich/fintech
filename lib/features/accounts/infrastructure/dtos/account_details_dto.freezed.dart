// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountDetailsDto {

 String get id; String get name; double get balance; String get currency; String get iban; String get accountType; String get status;
/// Create a copy of AccountDetailsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDetailsDtoCopyWith<AccountDetailsDto> get copyWith => _$AccountDetailsDtoCopyWithImpl<AccountDetailsDto>(this as AccountDetailsDto, _$identity);

  /// Serializes this AccountDetailsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDetailsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.iban, iban) || other.iban == iban)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency,iban,accountType,status);

@override
String toString() {
  return 'AccountDetailsDto(id: $id, name: $name, balance: $balance, currency: $currency, iban: $iban, accountType: $accountType, status: $status)';
}


}

/// @nodoc
abstract mixin class $AccountDetailsDtoCopyWith<$Res>  {
  factory $AccountDetailsDtoCopyWith(AccountDetailsDto value, $Res Function(AccountDetailsDto) _then) = _$AccountDetailsDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, double balance, String currency, String iban, String accountType, String status
});




}
/// @nodoc
class _$AccountDetailsDtoCopyWithImpl<$Res>
    implements $AccountDetailsDtoCopyWith<$Res> {
  _$AccountDetailsDtoCopyWithImpl(this._self, this._then);

  final AccountDetailsDto _self;
  final $Res Function(AccountDetailsDto) _then;

/// Create a copy of AccountDetailsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,Object? iban = null,Object? accountType = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,iban: null == iban ? _self.iban : iban // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountDetailsDto].
extension AccountDetailsDtoPatterns on AccountDetailsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountDetailsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountDetailsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountDetailsDto value)  $default,){
final _that = this;
switch (_that) {
case _AccountDetailsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountDetailsDto value)?  $default,){
final _that = this;
switch (_that) {
case _AccountDetailsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double balance,  String currency,  String iban,  String accountType,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountDetailsDto() when $default != null:
return $default(_that.id,_that.name,_that.balance,_that.currency,_that.iban,_that.accountType,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double balance,  String currency,  String iban,  String accountType,  String status)  $default,) {final _that = this;
switch (_that) {
case _AccountDetailsDto():
return $default(_that.id,_that.name,_that.balance,_that.currency,_that.iban,_that.accountType,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double balance,  String currency,  String iban,  String accountType,  String status)?  $default,) {final _that = this;
switch (_that) {
case _AccountDetailsDto() when $default != null:
return $default(_that.id,_that.name,_that.balance,_that.currency,_that.iban,_that.accountType,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountDetailsDto extends AccountDetailsDto {
  const _AccountDetailsDto({required this.id, required this.name, required this.balance, required this.currency, required this.iban, required this.accountType, required this.status}): super._();
  factory _AccountDetailsDto.fromJson(Map<String, dynamic> json) => _$AccountDetailsDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  double balance;
@override final  String currency;
@override final  String iban;
@override final  String accountType;
@override final  String status;

/// Create a copy of AccountDetailsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountDetailsDtoCopyWith<_AccountDetailsDto> get copyWith => __$AccountDetailsDtoCopyWithImpl<_AccountDetailsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountDetailsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountDetailsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.iban, iban) || other.iban == iban)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency,iban,accountType,status);

@override
String toString() {
  return 'AccountDetailsDto(id: $id, name: $name, balance: $balance, currency: $currency, iban: $iban, accountType: $accountType, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AccountDetailsDtoCopyWith<$Res> implements $AccountDetailsDtoCopyWith<$Res> {
  factory _$AccountDetailsDtoCopyWith(_AccountDetailsDto value, $Res Function(_AccountDetailsDto) _then) = __$AccountDetailsDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double balance, String currency, String iban, String accountType, String status
});




}
/// @nodoc
class __$AccountDetailsDtoCopyWithImpl<$Res>
    implements _$AccountDetailsDtoCopyWith<$Res> {
  __$AccountDetailsDtoCopyWithImpl(this._self, this._then);

  final _AccountDetailsDto _self;
  final $Res Function(_AccountDetailsDto) _then;

/// Create a copy of AccountDetailsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,Object? iban = null,Object? accountType = null,Object? status = null,}) {
  return _then(_AccountDetailsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,iban: null == iban ? _self.iban : iban // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
