import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/features/transactions/infrastructure/dtos/transaction_dtos.dart';
import 'package:injectable/injectable.dart';

abstract interface class TransactionsRemoteDataSource {
  Future<TransactionsListDto> fetchTransactions();

  Future<TransactionDetailsDto> fetchTransactionDetails({
    required String transactionId,
  });
}

@LazySingleton(as: TransactionsRemoteDataSource)
class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  TransactionsRemoteDataSourceImpl(@Named('api') this._dio);

  final Dio _dio;

  @override
  Future<TransactionsListDto> fetchTransactions() async {
    final Response<Map<String, Object?>> response =
        await _dio.get<Map<String, Object?>>(
      ApiEndpoints.transactions,
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty transactions response',
        type: DioExceptionType.badResponse,
      );
    }

    return TransactionsListDto.fromJson(data);
  }

  @override
  Future<TransactionDetailsDto> fetchTransactionDetails({
    required String transactionId,
  }) async {
    final Response<Map<String, Object?>> response =
        await _dio.get<Map<String, Object?>>(
      ApiEndpoints.transactionDetails(transactionId),
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty transaction details response',
        type: DioExceptionType.badResponse,
      );
    }

    return TransactionDetailsDto.fromJson(data);
  }
}
