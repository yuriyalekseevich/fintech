import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/transactions/domain/entities/transaction_details.dart';

sealed class TransactionDetailsState {
  const TransactionDetailsState();
}

final class TransactionDetailsInitial extends TransactionDetailsState {
  const TransactionDetailsInitial();
}

final class TransactionDetailsLoading extends TransactionDetailsState {
  const TransactionDetailsLoading();
}

final class TransactionDetailsLoaded extends TransactionDetailsState {
  const TransactionDetailsLoaded(this.details);

  final TransactionDetails details;
}

final class TransactionDetailsError extends TransactionDetailsState {
  const TransactionDetailsError(this.failure);

  final Failure failure;
}
