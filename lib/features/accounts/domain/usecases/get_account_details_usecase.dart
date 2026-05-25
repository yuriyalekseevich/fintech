import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/accounts/domain/entities/account_details.dart';
import 'package:fintech/features/accounts/domain/repositories/accounts_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAccountDetailsUseCase {
  GetAccountDetailsUseCase(this._repository);

  final AccountsRepository _repository;

  Future<Result<AccountDetails>> call({required String accountId}) =>
      _repository.getAccountDetails(accountId: accountId);
}
