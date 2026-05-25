sealed class AccountDetailsEvent {
  const AccountDetailsEvent();
}

final class AccountDetailsLoadRequested extends AccountDetailsEvent {
  const AccountDetailsLoadRequested();
}
