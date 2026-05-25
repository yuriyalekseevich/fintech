import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_response_dto.freezed.dart';
part 'cards_response_dto.g.dart';

@freezed
abstract class BankCardDto with _$BankCardDto {
  const BankCardDto._();

  const factory BankCardDto({
    required String id,
    required String last4,
    required String brand,
    required String type,
  }) = _BankCardDto;

  factory BankCardDto.fromJson(Map<String, Object?> json) =>
      _$BankCardDtoFromJson(json);

  BankCard toDomain() => BankCard(
        id: id,
        last4: last4,
        brand: brand,
        type: type,
      );
}

@freezed
abstract class CardsResponseDto with _$CardsResponseDto {
  const CardsResponseDto._();

  const factory CardsResponseDto({
    required List<BankCardDto> cards,
  }) = _CardsResponseDto;

  factory CardsResponseDto.fromJson(Map<String, Object?> json) =>
      _$CardsResponseDtoFromJson(json);
}
