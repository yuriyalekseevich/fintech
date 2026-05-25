// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => _AccountDto(
  id: json['id'] as String,
  name: json['name'] as String,
  balance: (json['balance'] as num).toDouble(),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$AccountDtoToJson(_AccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'currency': instance.currency,
    };

_AccountsResponseDto _$AccountsResponseDtoFromJson(Map<String, dynamic> json) =>
    _AccountsResponseDto(
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => AccountDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountsResponseDtoToJson(
  _AccountsResponseDto instance,
) => <String, dynamic>{'accounts': instance.accounts};
