import 'package:dio/dio.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/network/dio_failure_mapper.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:fintech/features/accounts/domain/entities/account_details.dart';
import 'package:fintech/features/accounts/domain/repositories/accounts_repository.dart';
import 'package:fintech/features/accounts/infrastructure/datasources/accounts_remote_data_source.dart';
import 'package:fintech/features/accounts/infrastructure/dtos/account_details_dto.dart';
import 'package:fintech/features/accounts/infrastructure/dtos/accounts_response_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AccountsRepository)
class AccountsRepositoryImpl implements AccountsRepository {
  AccountsRepositoryImpl(this._remoteDataSource);

  final AccountsRemoteDataSource _remoteDataSource;

  @override
  Future<Result<List<Account>>> getAccounts() async {
    try {
      final AccountsResponseDto dto = await _remoteDataSource.fetchAccounts();
      final List<Account> accounts =
          dto.accounts.map((AccountDto e) => e.toDomain()).toList();
      return Success<List<Account>>(accounts);
    } on DioException catch (error) {
      return Error<List<Account>>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<List<Account>>(
        UnexpectedFailure(message: 'Failed to load accounts', cause: error),
      );
    }
  }

  @override
  Future<Result<AccountDetails>> getAccountDetails({
    required String accountId,
  }) async {
    try {
      final AccountDetailsDto dto =
          await _remoteDataSource.fetchAccountDetails(accountId: accountId);
      return Success<AccountDetails>(dto.toDomain());
    } on DioException catch (error) {
      return Error<AccountDetails>(DioFailureMapper.map(error));
    } on Object catch (error) {
      return Error<AccountDetails>(
        UnexpectedFailure(
          message: 'Failed to load account details',
          cause: error,
        ),
      );
    }
  }
}
