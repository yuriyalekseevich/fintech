import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/validation_result.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:fintech/features/accounts/domain/repositories/accounts_repository.dart';
import 'package:fintech/features/accounts/domain/requests/create_account_request.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateAccountUseCase {
  CreateAccountUseCase(this._repository);

  final AccountsRepository _repository;

  Future<Result<Account>> call({
    required String name,
    required String currency,
    required String accountType,
    String? initialBalance,
  }) async {
    final ValidationResult<CreateAccountRequest> validation =
        CreateAccountRequest.create(
      name: name,
      currency: currency,
      accountType: accountType,
      initialBalance: initialBalance,
    );

    return switch (validation) {
      Invalid(:final failure) => Error<Account>(failure),
      Valid(:final value) => _repository.createAccount(value),
    };
  }
}
