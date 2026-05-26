final class Transaction {
  const Transaction({
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
      'Transaction(id: $id, title: $title, amount: $amount, date: $date)';
}
