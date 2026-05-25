import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/transaction_summary.dart';
import 'package:fintech/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTransactionsUseCase {
  GetTransactionsUseCase(this._repository);

  final TransactionsRepository _repository;

  Future<Result<List<TransactionSummary>>> call() =>
      _repository.getTransactions();
}
