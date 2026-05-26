import 'package:fintech/core/domain/transaction_summary.dart';

final class UserProfile {
  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.recentTransactions,
  });

  final String id;
  final String fullName;
  final String email;
  final List<TransactionSummary> recentTransactions;

  @override
  String toString() =>
      'UserProfile(id: $id, fullName: $fullName, email: $email, '
      'recentTransactions: $recentTransactions)';
}
