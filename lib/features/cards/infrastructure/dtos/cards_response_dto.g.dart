// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankCardDto _$BankCardDtoFromJson(Map<String, dynamic> json) => _BankCardDto(
  id: json['id'] as String,
  last4: json['last4'] as String,
  brand: json['brand'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$BankCardDtoToJson(_BankCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last4': instance.last4,
      'brand': instance.brand,
      'type': instance.type,
    };

_CardsResponseDto _$CardsResponseDtoFromJson(Map<String, dynamic> json) =>
    _CardsResponseDto(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => BankCardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardsResponseDtoToJson(_CardsResponseDto instance) =>
    <String, dynamic>{'cards': instance.cards};
