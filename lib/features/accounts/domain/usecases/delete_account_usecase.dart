import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/resource_id.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/accounts/domain/repositories/accounts_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteAccountUseCase {
  DeleteAccountUseCase(this._repository);

  final AccountsRepository _repository;

  Future<Result<void>> call({required String accountId}) async {
    final String trimmedId = accountId.trim();
    if (!ResourceId.isValid(trimmedId)) {
      return const Error<void>(
        ValidationFailure(message: 'Invalid account identifier'),
      );
    }

    return _repository.deleteAccount(accountId: trimmedId);
  }
}
