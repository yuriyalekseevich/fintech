/// Full card payload from `/cards/:id`.
final class CardDetails {
  const CardDetails({
    required this.id,
    required this.last4,
    required this.brand,
    required this.type,
    required this.holderName,
    required this.expiryDate,
    required this.status,
    required this.dailyLimit,
    required this.currency,
  });

  final String id;
  final String last4;
  final String brand;
  final String type;
  final String holderName;
  final String expiryDate;
  final String status;
  final double dailyLimit;
  final String currency;

  @override
  String toString() =>
      'CardDetails(id: $id, last4: $last4, brand: $brand, type: $type, '
      'holderName: $holderName, expiryDate: $expiryDate, status: $status, '
      'dailyLimit: $dailyLimit, currency: $currency)';
}
