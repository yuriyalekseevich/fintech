import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/transactions/domain/entities/transaction_details.dart';
import 'package:fintech/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTransactionDetailsUseCase {
  GetTransactionDetailsUseCase(this._repository);

  final TransactionsRepository _repository;

  Future<Result<TransactionDetails>> call({
    required String transactionId,
  }) =>
      _repository.getTransactionDetails(transactionId: transactionId);
}
