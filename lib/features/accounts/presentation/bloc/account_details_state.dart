import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/accounts/domain/entities/account_details.dart';

sealed class AccountDetailsState {
  const AccountDetailsState();
}

final class AccountDetailsInitial extends AccountDetailsState {
  const AccountDetailsInitial();
}

final class AccountDetailsLoading extends AccountDetailsState {
  const AccountDetailsLoading();
}

final class AccountDetailsLoaded extends AccountDetailsState {
  const AccountDetailsLoaded(this.details);

  final AccountDetails details;
}

final class AccountDetailsError extends AccountDetailsState {
  const AccountDetailsError(this.failure);

  final Failure failure;
}
