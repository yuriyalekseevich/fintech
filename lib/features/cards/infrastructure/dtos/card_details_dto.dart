import 'package:fintech/features/cards/domain/entities/card_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_details_dto.freezed.dart';
part 'card_details_dto.g.dart';

@freezed
abstract class CardDetailsDto with _$CardDetailsDto {
  const CardDetailsDto._();

  const factory CardDetailsDto({
    required String id,
    required String last4,
    required String brand,
    required String type,
    required String holderName,
    required String expiryDate,
    required String status,
    required double dailyLimit,
    required String currency,
  }) = _CardDetailsDto;

  factory CardDetailsDto.fromJson(Map<String, Object?> json) =>
      _$CardDetailsDtoFromJson(json);

  CardDetails toDomain() => CardDetails(
        id: id,
        last4: last4,
        brand: brand,
        type: type,
        holderName: holderName,
        expiryDate: expiryDate,
        status: status,
        dailyLimit: dailyLimit,
        currency: currency,
      );
}
