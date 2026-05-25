// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountDto {

 String get id; String get name; double get balance; String get currency;
/// Create a copy of AccountDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDtoCopyWith<AccountDto> get copyWith => _$AccountDtoCopyWithImpl<AccountDto>(this as AccountDto, _$identity);

  /// Serializes this AccountDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountDto(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountDtoCopyWith<$Res>  {
  factory $AccountDtoCopyWith(AccountDto value, $Res Function(AccountDto) _then) = _$AccountDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, double balance, String currency
});




}
/// @nodoc
class _$AccountDtoCopyWithImpl<$Res>
    implements $AccountDtoCopyWith<$Res> {
  _$AccountDtoCopyWithImpl(this._self, this._then);

  final AccountDto _self;
  final $Res Function(AccountDto) _then;

/// Create a copy of AccountDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountDto].
extension AccountDtoPatterns on AccountDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountDto value)  $default,){
final _that = this;
switch (_that) {
case _AccountDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountDto value)?  $default,){
final _that = this;
switch (_that) {
case _AccountDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double balance,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountDto() when $default != null:
return $default(_that.id,_that.name,_that.balance,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double balance,  String currency)  $default,) {final _that = this;
switch (_that) {
case _AccountDto():
return $default(_that.id,_that.name,_that.balance,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double balance,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _AccountDto() when $default != null:
return $default(_that.id,_that.name,_that.balance,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountDto extends AccountDto {
  const _AccountDto({required this.id, required this.name, required this.balance, required this.currency}): super._();
  factory _AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  double balance;
@override final  String currency;

/// Create a copy of AccountDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountDtoCopyWith<_AccountDto> get copyWith => __$AccountDtoCopyWithImpl<_AccountDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountDto(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountDtoCopyWith<$Res> implements $AccountDtoCopyWith<$Res> {
  factory _$AccountDtoCopyWith(_AccountDto value, $Res Function(_AccountDto) _then) = __$AccountDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double balance, String currency
});




}
/// @nodoc
class __$AccountDtoCopyWithImpl<$Res>
    implements _$AccountDtoCopyWith<$Res> {
  __$AccountDtoCopyWithImpl(this._self, this._then);

  final _AccountDto _self;
  final $Res Function(_AccountDto) _then;

/// Create a copy of AccountDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AccountsResponseDto {

 List<AccountDto> get accounts;
/// Create a copy of AccountsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountsResponseDtoCopyWith<AccountsResponseDto> get copyWith => _$AccountsResponseDtoCopyWithImpl<AccountsResponseDto>(this as AccountsResponseDto, _$identity);

  /// Serializes this AccountsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountsResponseDto&&const DeepCollectionEquality().equals(other.accounts, accounts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(accounts));

@override
String toString() {
  return 'AccountsResponseDto(accounts: $accounts)';
}


}

/// @nodoc
abstract mixin class $AccountsResponseDtoCopyWith<$Res>  {
  factory $AccountsResponseDtoCopyWith(AccountsResponseDto value, $Res Function(AccountsResponseDto) _then) = _$AccountsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<AccountDto> accounts
});




}
/// @nodoc
class _$AccountsResponseDtoCopyWithImpl<$Res>
    implements $AccountsResponseDtoCopyWith<$Res> {
  _$AccountsResponseDtoCopyWithImpl(this._self, this._then);

  final AccountsResponseDto _self;
  final $Res Function(AccountsResponseDto) _then;

/// Create a copy of AccountsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accounts = null,}) {
  return _then(_self.copyWith(
accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AccountDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountsResponseDto].
extension AccountsResponseDtoPatterns on AccountsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AccountsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AccountsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AccountDto> accounts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountsResponseDto() when $default != null:
return $default(_that.accounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AccountDto> accounts)  $default,) {final _that = this;
switch (_that) {
case _AccountsResponseDto():
return $default(_that.accounts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AccountDto> accounts)?  $default,) {final _that = this;
switch (_that) {
case _AccountsResponseDto() when $default != null:
return $default(_that.accounts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountsResponseDto extends AccountsResponseDto {
  const _AccountsResponseDto({required final  List<AccountDto> accounts}): _accounts = accounts,super._();
  factory _AccountsResponseDto.fromJson(Map<String, dynamic> json) => _$AccountsResponseDtoFromJson(json);

 final  List<AccountDto> _accounts;
@override List<AccountDto> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}


/// Create a copy of AccountsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountsResponseDtoCopyWith<_AccountsResponseDto> get copyWith => __$AccountsResponseDtoCopyWithImpl<_AccountsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountsResponseDto&&const DeepCollectionEquality().equals(other._accounts, _accounts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accounts));

@override
String toString() {
  return 'AccountsResponseDto(accounts: $accounts)';
}


}

/// @nodoc
abstract mixin class _$AccountsResponseDtoCopyWith<$Res> implements $AccountsResponseDtoCopyWith<$Res> {
  factory _$AccountsResponseDtoCopyWith(_AccountsResponseDto value, $Res Function(_AccountsResponseDto) _then) = __$AccountsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<AccountDto> accounts
});




}
/// @nodoc
class __$AccountsResponseDtoCopyWithImpl<$Res>
    implements _$AccountsResponseDtoCopyWith<$Res> {
  __$AccountsResponseDtoCopyWithImpl(this._self, this._then);

  final _AccountsResponseDto _self;
  final $Res Function(_AccountsResponseDto) _then;

/// Create a copy of AccountsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accounts = null,}) {
  return _then(_AccountsResponseDto(
accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AccountDto>,
  ));
}


}

// dart format on
