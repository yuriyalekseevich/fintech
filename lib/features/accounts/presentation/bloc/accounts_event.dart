sealed class AccountsEvent {
  const AccountsEvent();
}

final class AccountsLoadRequested extends AccountsEvent {
  const AccountsLoadRequested();
}

final class AccountsRefreshRequested extends AccountsEvent {
  const AccountsRefreshRequested();
}
