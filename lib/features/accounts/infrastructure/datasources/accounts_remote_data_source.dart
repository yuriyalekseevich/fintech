import 'package:dio/dio.dart';
import 'package:fintech/core/network/api_endpoints.dart';
import 'package:fintech/features/accounts/infrastructure/dtos/account_details_dto.dart';
import 'package:fintech/features/accounts/infrastructure/dtos/accounts_response_dto.dart';
import 'package:injectable/injectable.dart';

abstract interface class AccountsRemoteDataSource {
  Future<AccountsResponseDto> fetchAccounts();

  Future<AccountDetailsDto> fetchAccountDetails({required String accountId});
}

@LazySingleton(as: AccountsRemoteDataSource)
class AccountsRemoteDataSourceImpl implements AccountsRemoteDataSource {
  AccountsRemoteDataSourceImpl(@Named('api') this._dio);

  final Dio _dio;

  @override
  Future<AccountsResponseDto> fetchAccounts() async {
    final Response<Map<String, Object?>> response =
        await _dio.get<Map<String, Object?>>(
      ApiEndpoints.accounts,
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty accounts response',
        type: DioExceptionType.badResponse,
      );
    }

    return AccountsResponseDto.fromJson(data);
  }

  @override
  Future<AccountDetailsDto> fetchAccountDetails({
    required String accountId,
  }) async {
    final Response<Map<String, Object?>> response =
        await _dio.get<Map<String, Object?>>(
      ApiEndpoints.accountDetails(accountId),
    );

    final Map<String, Object?>? data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Empty account details response',
        type: DioExceptionType.badResponse,
      );
    }

    return AccountDetailsDto.fromJson(data);
  }
}
