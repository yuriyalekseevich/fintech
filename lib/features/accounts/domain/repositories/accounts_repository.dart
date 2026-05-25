import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';
import 'package:fintech/features/accounts/domain/entities/account_details.dart';

abstract interface class AccountsRepository {
  Future<Result<List<Account>>> getAccounts();

  Future<Result<AccountDetails>> getAccountDetails({required String accountId});
}
