sealed class AddCardEvent {
  const AddCardEvent();
}

final class AddCardSubmitted extends AddCardEvent {
  const AddCardSubmitted({
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
    required this.type,
  });

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
  final String type;
}
