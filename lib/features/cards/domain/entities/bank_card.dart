final class BankCard {
  const BankCard({
    required this.id,
    required this.last4,
    required this.brand,
    required this.type,
  });

  final String id;
  final String last4;
  final String brand;
  final String type;

  @override
  String toString() =>
      'BankCard(id: $id, last4: $last4, brand: $brand, type: $type)';
}
