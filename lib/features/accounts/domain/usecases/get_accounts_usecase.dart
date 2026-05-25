import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:fintech/features/accounts/domain/repositories/accounts_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAccountsUseCase {
  GetAccountsUseCase(this._repository);

  final AccountsRepository _repository;

  Future<Result<List<Account>>> call() => _repository.getAccounts();
}
