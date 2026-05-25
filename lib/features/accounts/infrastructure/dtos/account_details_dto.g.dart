// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountDetailsDto _$AccountDetailsDtoFromJson(Map<String, dynamic> json) =>
    _AccountDetailsDto(
      id: json['id'] as String,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
      iban: json['iban'] as String,
      accountType: json['accountType'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$AccountDetailsDtoToJson(_AccountDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
      'iban': instance.iban,
      'accountType': instance.accountType,
      'status': instance.status,
    };
