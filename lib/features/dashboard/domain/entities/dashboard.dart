import 'package:fintech/features/dashboard/domain/entities/transaction.dart';

final class Dashboard {
  const Dashboard({
    required this.balance,
    required this.currency,
    required this.recentTransactions,
  });

  final double balance;
  final String currency;
  final List<Transaction> recentTransactions;

  @override
  String toString() =>
      'Dashboard(balance: $balance, currency: $currency, '
      'recentTransactions: $recentTransactions)';
}
