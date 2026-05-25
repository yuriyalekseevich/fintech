import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/transaction_summary.dart';
import 'package:fintech/features/transactions/domain/entities/transaction_details.dart';

abstract interface class TransactionsRepository {
  Future<Result<List<TransactionSummary>>> getTransactions();

  Future<Result<TransactionDetails>> getTransactionDetails({
    required String transactionId,
  });
}
