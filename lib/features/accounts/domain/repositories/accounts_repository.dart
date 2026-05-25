import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:fintech/features/accounts/domain/entities/account_details.dart';
import 'package:fintech/features/accounts/domain/requests/create_account_request.dart';

abstract interface class AccountsRepository {
  Future<Result<List<Account>>> getAccounts();

  Future<Result<AccountDetails>> getAccountDetails({required String accountId});

  Future<Result<Account>> createAccount(CreateAccountRequest request);

  Future<Result<void>> deleteAccount({required String accountId});
}
