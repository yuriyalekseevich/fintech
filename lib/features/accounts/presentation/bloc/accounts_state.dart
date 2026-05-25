import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/accounts/domain/entities/account.dart';

sealed class AccountsState {
  const AccountsState();
}

final class AccountsInitial extends AccountsState {
  const AccountsInitial();
}

final class AccountsLoading extends AccountsState {
  const AccountsLoading();
}

final class AccountsLoaded extends AccountsState {
  const AccountsLoaded(this.accounts);

  final List<Account> accounts;
}

final class AccountsError extends AccountsState {
  const AccountsError(this.failure);

  final Failure failure;
}
