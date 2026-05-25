import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/transaction_summary.dart';

sealed class TransactionsState {
  const TransactionsState();
}

final class TransactionsInitial extends TransactionsState {
  const TransactionsInitial();
}

final class TransactionsLoading extends TransactionsState {
  const TransactionsLoading();
}

final class TransactionsLoaded extends TransactionsState {
  const TransactionsLoaded(this.transactions);

  final List<TransactionSummary> transactions;
}

final class TransactionsError extends TransactionsState {
  const TransactionsError(this.failure);

  final Failure failure;
}
