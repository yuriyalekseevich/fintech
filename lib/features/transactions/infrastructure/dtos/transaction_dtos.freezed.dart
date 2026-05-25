// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionSummaryDto {

 String get id; String get title; double get amount; String get date;
/// Create a copy of TransactionSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionSummaryDtoCopyWith<TransactionSummaryDto> get copyWith => _$TransactionSummaryDtoCopyWithImpl<TransactionSummaryDto>(this as TransactionSummaryDto, _$identity);

  /// Serializes this TransactionSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,date);

@override
String toString() {
  return 'TransactionSummaryDto(id: $id, title: $title, amount: $amount, date: $date)';
}


}

/// @nodoc
abstract mixin class $TransactionSummaryDtoCopyWith<$Res>  {
  factory $TransactionSummaryDtoCopyWith(TransactionSummaryDto value, $Res Function(TransactionSummaryDto) _then) = _$TransactionSummaryDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, double amount, String date
});




}
/// @nodoc
class _$TransactionSummaryDtoCopyWithImpl<$Res>
    implements $TransactionSummaryDtoCopyWith<$Res> {
  _$TransactionSummaryDtoCopyWithImpl(this._self, this._then);

  final TransactionSummaryDto _self;
  final $Res Function(TransactionSummaryDto) _then;

/// Create a copy of TransactionSummaryDto
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


/// Adds pattern-matching-related methods to [TransactionSummaryDto].
extension TransactionSummaryDtoPatterns on TransactionSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _TransactionSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionSummaryDto() when $default != null:
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
case _TransactionSummaryDto() when $default != null:
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
case _TransactionSummaryDto():
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
case _TransactionSummaryDto() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionSummaryDto extends TransactionSummaryDto {
  const _TransactionSummaryDto({required this.id, required this.title, required this.amount, required this.date}): super._();
  factory _TransactionSummaryDto.fromJson(Map<String, dynamic> json) => _$TransactionSummaryDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  double amount;
@override final  String date;

/// Create a copy of TransactionSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionSummaryDtoCopyWith<_TransactionSummaryDto> get copyWith => __$TransactionSummaryDtoCopyWithImpl<_TransactionSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,date);

@override
String toString() {
  return 'TransactionSummaryDto(id: $id, title: $title, amount: $amount, date: $date)';
}


}

/// @nodoc
abstract mixin class _$TransactionSummaryDtoCopyWith<$Res> implements $TransactionSummaryDtoCopyWith<$Res> {
  factory _$TransactionSummaryDtoCopyWith(_TransactionSummaryDto value, $Res Function(_TransactionSummaryDto) _then) = __$TransactionSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, double amount, String date
});




}
/// @nodoc
class __$TransactionSummaryDtoCopyWithImpl<$Res>
    implements _$TransactionSummaryDtoCopyWith<$Res> {
  __$TransactionSummaryDtoCopyWithImpl(this._self, this._then);

  final _TransactionSummaryDto _self;
  final $Res Function(_TransactionSummaryDto) _then;

/// Create a copy of TransactionSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? date = null,}) {
  return _then(_TransactionSummaryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TransactionsListDto {

 List<TransactionSummaryDto> get transactions;
/// Create a copy of TransactionsListDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsListDtoCopyWith<TransactionsListDto> get copyWith => _$TransactionsListDtoCopyWithImpl<TransactionsListDto>(this as TransactionsListDto, _$identity);

  /// Serializes this TransactionsListDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsListDto&&const DeepCollectionEquality().equals(other.transactions, transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'TransactionsListDto(transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $TransactionsListDtoCopyWith<$Res>  {
  factory $TransactionsListDtoCopyWith(TransactionsListDto value, $Res Function(TransactionsListDto) _then) = _$TransactionsListDtoCopyWithImpl;
@useResult
$Res call({
 List<TransactionSummaryDto> transactions
});




}
/// @nodoc
class _$TransactionsListDtoCopyWithImpl<$Res>
    implements $TransactionsListDtoCopyWith<$Res> {
  _$TransactionsListDtoCopyWithImpl(this._self, this._then);

  final TransactionsListDto _self;
  final $Res Function(TransactionsListDto) _then;

/// Create a copy of TransactionsListDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactions = null,}) {
  return _then(_self.copyWith(
transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionSummaryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionsListDto].
extension TransactionsListDtoPatterns on TransactionsListDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionsListDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionsListDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionsListDto value)  $default,){
final _that = this;
switch (_that) {
case _TransactionsListDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionsListDto value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionsListDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TransactionSummaryDto> transactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionsListDto() when $default != null:
return $default(_that.transactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TransactionSummaryDto> transactions)  $default,) {final _that = this;
switch (_that) {
case _TransactionsListDto():
return $default(_that.transactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TransactionSummaryDto> transactions)?  $default,) {final _that = this;
switch (_that) {
case _TransactionsListDto() when $default != null:
return $default(_that.transactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionsListDto implements TransactionsListDto {
  const _TransactionsListDto({required final  List<TransactionSummaryDto> transactions}): _transactions = transactions;
  factory _TransactionsListDto.fromJson(Map<String, dynamic> json) => _$TransactionsListDtoFromJson(json);

 final  List<TransactionSummaryDto> _transactions;
@override List<TransactionSummaryDto> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of TransactionsListDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsListDtoCopyWith<_TransactionsListDto> get copyWith => __$TransactionsListDtoCopyWithImpl<_TransactionsListDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionsListDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsListDto&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'TransactionsListDto(transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$TransactionsListDtoCopyWith<$Res> implements $TransactionsListDtoCopyWith<$Res> {
  factory _$TransactionsListDtoCopyWith(_TransactionsListDto value, $Res Function(_TransactionsListDto) _then) = __$TransactionsListDtoCopyWithImpl;
@override @useResult
$Res call({
 List<TransactionSummaryDto> transactions
});




}
/// @nodoc
class __$TransactionsListDtoCopyWithImpl<$Res>
    implements _$TransactionsListDtoCopyWith<$Res> {
  __$TransactionsListDtoCopyWithImpl(this._self, this._then);

  final _TransactionsListDto _self;
  final $Res Function(_TransactionsListDto) _then;

/// Create a copy of TransactionsListDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactions = null,}) {
  return _then(_TransactionsListDto(
transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionSummaryDto>,
  ));
}


}


/// @nodoc
mixin _$TransactionDetailsDto {

 String get id; String get title; double get amount; String get currency; String get date; String get category; String get status; String get merchant; String get reference; String get description;
/// Create a copy of TransactionDetailsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDetailsDtoCopyWith<TransactionDetailsDto> get copyWith => _$TransactionDetailsDtoCopyWithImpl<TransactionDetailsDto>(this as TransactionDetailsDto, _$identity);

  /// Serializes this TransactionDetailsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDetailsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.date, date) || other.date == date)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,currency,date,category,status,merchant,reference,description);

@override
String toString() {
  return 'TransactionDetailsDto(id: $id, title: $title, amount: $amount, currency: $currency, date: $date, category: $category, status: $status, merchant: $merchant, reference: $reference, description: $description)';
}


}

/// @nodoc
abstract mixin class $TransactionDetailsDtoCopyWith<$Res>  {
  factory $TransactionDetailsDtoCopyWith(TransactionDetailsDto value, $Res Function(TransactionDetailsDto) _then) = _$TransactionDetailsDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, double amount, String currency, String date, String category, String status, String merchant, String reference, String description
});




}
/// @nodoc
class _$TransactionDetailsDtoCopyWithImpl<$Res>
    implements $TransactionDetailsDtoCopyWith<$Res> {
  _$TransactionDetailsDtoCopyWithImpl(this._self, this._then);

  final TransactionDetailsDto _self;
  final $Res Function(TransactionDetailsDto) _then;

/// Create a copy of TransactionDetailsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? currency = null,Object? date = null,Object? category = null,Object? status = null,Object? merchant = null,Object? reference = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionDetailsDto].
extension TransactionDetailsDtoPatterns on TransactionDetailsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionDetailsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionDetailsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionDetailsDto value)  $default,){
final _that = this;
switch (_that) {
case _TransactionDetailsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionDetailsDto value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionDetailsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  double amount,  String currency,  String date,  String category,  String status,  String merchant,  String reference,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDetailsDto() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.currency,_that.date,_that.category,_that.status,_that.merchant,_that.reference,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  double amount,  String currency,  String date,  String category,  String status,  String merchant,  String reference,  String description)  $default,) {final _that = this;
switch (_that) {
case _TransactionDetailsDto():
return $default(_that.id,_that.title,_that.amount,_that.currency,_that.date,_that.category,_that.status,_that.merchant,_that.reference,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  double amount,  String currency,  String date,  String category,  String status,  String merchant,  String reference,  String description)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDetailsDto() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.currency,_that.date,_that.category,_that.status,_that.merchant,_that.reference,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionDetailsDto extends TransactionDetailsDto {
  const _TransactionDetailsDto({required this.id, required this.title, required this.amount, required this.currency, required this.date, required this.category, required this.status, required this.merchant, required this.reference, required this.description}): super._();
  factory _TransactionDetailsDto.fromJson(Map<String, dynamic> json) => _$TransactionDetailsDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  double amount;
@override final  String currency;
@override final  String date;
@override final  String category;
@override final  String status;
@override final  String merchant;
@override final  String reference;
@override final  String description;

/// Create a copy of TransactionDetailsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDetailsDtoCopyWith<_TransactionDetailsDto> get copyWith => __$TransactionDetailsDtoCopyWithImpl<_TransactionDetailsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionDetailsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDetailsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.date, date) || other.date == date)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,currency,date,category,status,merchant,reference,description);

@override
String toString() {
  return 'TransactionDetailsDto(id: $id, title: $title, amount: $amount, currency: $currency, date: $date, category: $category, status: $status, merchant: $merchant, reference: $reference, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TransactionDetailsDtoCopyWith<$Res> implements $TransactionDetailsDtoCopyWith<$Res> {
  factory _$TransactionDetailsDtoCopyWith(_TransactionDetailsDto value, $Res Function(_TransactionDetailsDto) _then) = __$TransactionDetailsDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, double amount, String currency, String date, String category, String status, String merchant, String reference, String description
});




}
/// @nodoc
class __$TransactionDetailsDtoCopyWithImpl<$Res>
    implements _$TransactionDetailsDtoCopyWith<$Res> {
  __$TransactionDetailsDtoCopyWithImpl(this._self, this._then);

  final _TransactionDetailsDto _self;
  final $Res Function(_TransactionDetailsDto) _then;

/// Create a copy of TransactionDetailsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? currency = null,Object? date = null,Object? category = null,Object? status = null,Object? merchant = null,Object? reference = null,Object? description = null,}) {
  return _then(_TransactionDetailsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,merchant: null == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
