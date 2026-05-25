sealed class AccountDetailsEvent {
  const AccountDetailsEvent();
}

final class AccountDetailsLoadRequested extends AccountDetailsEvent {
  const AccountDetailsLoadRequested();
}

final class AccountDetailsDeleteRequested extends AccountDetailsEvent {
  const AccountDetailsDeleteRequested();
}
