import 'package:fintech/features/cards/domain/requests/create_card_request.dart';

/// Serializes [CreateCardRequest] for POST `/cards`. PAN is sent only over TLS.
final class CreateCardRequestDto {
  const CreateCardRequestDto({
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
    required this.holderName,
    required this.addressLine1,
    required this.addressLine2,
    required this.state,
    required this.zipCode,
    required this.currency,
    required this.brand,
    required this.type,
  });

  factory CreateCardRequestDto.fromDomain(CreateCardRequest request) {
    return CreateCardRequestDto(
      cardNumber: request.cardNumber,
      expiryMonth: request.expiryMonth,
      expiryYear: request.expiryYear,
      cvv: request.cvv,
      holderName: request.holderName,
      addressLine1: request.addressLine1,
      addressLine2: request.addressLine2,
      state: request.state,
      zipCode: request.zipCode,
      currency: request.currency.code,
      brand: request.brand,
      type: request.type,
    );
  }

  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;
  final String cvv;
  final String holderName;
  final String addressLine1;
  final String addressLine2;
  final String state;
  final String zipCode;
  final String currency;
  final String brand;
  final String type;

  Map<String, Object?> toJson() => <String, Object?>{
        'cardNumber': cardNumber,
        'expiryMonth': expiryMonth,
        'expiryYear': expiryYear,
        'cvv': cvv,
        'holderName': holderName,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'state': state,
        'zipCode': zipCode,
        'currency': currency,
        'brand': brand,
        'type': type,
      };
}
