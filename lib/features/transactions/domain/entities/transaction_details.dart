/// Full transaction payload from `/transactions/:id`.
final class TransactionDetails {
  const TransactionDetails({
    required this.id,
    required this.title,
    required this.amount,
    required this.currency,
    required this.date,
    required this.category,
    required this.status,
    required this.merchant,
    required this.reference,
    required this.description,
  });

  final String id;
  final String title;
  final double amount;
  final String currency;
  final String date;
  final String category;
  final String status;
  final String merchant;
  final String reference;
  final String description;

  @override
  String toString() =>
      'TransactionDetails(id: $id, title: $title, amount: $amount, '
      'currency: $currency, date: $date, category: $category, status: $status, '
      'merchant: $merchant, reference: $reference, description: $description)';
}
