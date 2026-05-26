/// Shared read model for transaction lists (profile preview, transactions screen).
final class TransactionSummary {
  const TransactionSummary({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  final String id;
  final String title;
  final double amount;
  final String date;

  @override
  String toString() =>
      'TransactionSummary(id: $id, title: $title, amount: $amount, date: $date)';
}
