// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) =>
    _TransactionDto(
      id: json['id'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$TransactionDtoToJson(_TransactionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'date': instance.date,
    };

_DashboardDto _$DashboardDtoFromJson(Map<String, dynamic> json) =>
    _DashboardDto(
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
      recentTransactions: (json['recentTransactions'] as List<dynamic>)
          .map((e) => TransactionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardDtoToJson(_DashboardDto instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'currency': instance.currency,
      'recentTransactions': instance.recentTransactions,
    };
