// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionSummaryDto _$TransactionSummaryDtoFromJson(
  Map<String, dynamic> json,
) => _TransactionSummaryDto(
  id: json['id'] as String,
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  date: json['date'] as String,
);

Map<String, dynamic> _$TransactionSummaryDtoToJson(
  _TransactionSummaryDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'amount': instance.amount,
  'date': instance.date,
};

_TransactionsListDto _$TransactionsListDtoFromJson(Map<String, dynamic> json) =>
    _TransactionsListDto(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionsListDtoToJson(
  _TransactionsListDto instance,
) => <String, dynamic>{'transactions': instance.transactions};

_TransactionDetailsDto _$TransactionDetailsDtoFromJson(
  Map<String, dynamic> json,
) => _TransactionDetailsDto(
  id: json['id'] as String,
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
  date: json['date'] as String,
  category: json['category'] as String,
  status: json['status'] as String,
  merchant: json['merchant'] as String,
  reference: json['reference'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$TransactionDetailsDtoToJson(
  _TransactionDetailsDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'amount': instance.amount,
  'currency': instance.currency,
  'date': instance.date,
  'category': instance.category,
  'status': instance.status,
  'merchant': instance.merchant,
  'reference': instance.reference,
  'description': instance.description,
};
