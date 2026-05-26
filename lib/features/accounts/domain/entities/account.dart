final class Account {
  const Account({
    required this.id,
    required this.name,
    required this.balance,
    required this.currency,
  });

  final String id;
  final String name;
  final double balance;
  final String currency;

  @override
  String toString() =>
      'Account(id: $id, name: $name, balance: $balance, currency: $currency)';
}
