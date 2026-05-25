// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileTransactionDto _$ProfileTransactionDtoFromJson(
  Map<String, dynamic> json,
) => _ProfileTransactionDto(
  id: json['id'] as String,
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  date: json['date'] as String,
);

Map<String, dynamic> _$ProfileTransactionDtoToJson(
  _ProfileTransactionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'amount': instance.amount,
  'date': instance.date,
};
