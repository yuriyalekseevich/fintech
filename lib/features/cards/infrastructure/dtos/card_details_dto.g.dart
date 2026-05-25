// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardDetailsDto _$CardDetailsDtoFromJson(Map<String, dynamic> json) =>
    _CardDetailsDto(
      id: json['id'] as String,
      last4: json['last4'] as String,
      brand: json['brand'] as String,
      type: json['type'] as String,
      holderName: json['holderName'] as String,
      expiryDate: json['expiryDate'] as String,
      status: json['status'] as String,
      dailyLimit: (json['dailyLimit'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$CardDetailsDtoToJson(_CardDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last4': instance.last4,
      'brand': instance.brand,
      'type': instance.type,
      'holderName': instance.holderName,
      'expiryDate': instance.expiryDate,
      'status': instance.status,
      'dailyLimit': instance.dailyLimit,
      'currency': instance.currency,
    };
