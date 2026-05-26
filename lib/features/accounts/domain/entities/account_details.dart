/// Full account payload from `/accounts/:id`.
final class AccountDetails {
  const AccountDetails({
    required this.id,
    required this.name,
    required this.balance,
    required this.currency,
    required this.iban,
    required this.accountType,
    required this.status,
  });

  final String id;
  final String name;
  final double balance;
  final String currency;
  final String iban;
  final String accountType;
  final String status;

  @override
  String toString() =>
      'AccountDetails(id: $id, name: $name, balance: $balance, currency: $currency, '
      'iban: $iban, accountType: $accountType, status: $status)';
}
