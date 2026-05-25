import 'package:dio/dio.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/transaction_summary.dart';
import 'package:fintech/core/network/dio_failure_mapper.dart';
import 'package:fintech/features/transactions/domain/entities/transaction_details.dart';
import 'package:fintech/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:fintech/features/transactions/infrastructure/datasources/transactions_remote_data_source.dart';
import 'package:fintech/features/transactions/infrastructure/dtos/transaction_dtos.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TransactionsRepository)
class TransactionsRepositoryImpl implements TransactionsRepository {
  TransactionsRepositoryImpl(this._remoteDataSource);

  final TransactionsRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<TransactionSummary>>> getTransactions() async {
    try {
      final TransactionsListDto dto = await _remoteDataSource.fetchTransactions();
      final List<TransactionSummary> items = dto.transactions
          .map((TransactionSummaryDto e) => e.toDomain())
          .toList();
      return Success<List<TransactionSummary>>(items);
    } on DioException catch (error) {
      return Error<List<TransactionSummary>>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<List<TransactionSummary>>(
        UnexpectedFailure(message: 'Failed to load transactions', cause: error),
      );
    }
  }

  @override
  Future<Result<TransactionDetails>> getTransactionDetails({
    required String transactionId,
  }) async {
    try {
      final TransactionDetailsDto dto =
          await _remoteDataSource.fetchTransactionDetails(
        transactionId: transactionId,
      );
      return Success<TransactionDetails>(dto.toDomain());
    } on DioException catch (error) {
      return Error<TransactionDetails>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<TransactionDetails>(
        UnexpectedFailure(
          message: 'Failed to load transaction details',
          cause: error,
        ),
      );
    }
  }
}
