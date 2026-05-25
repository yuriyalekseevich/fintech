sealed class AddAccountEvent {
  const AddAccountEvent();
}

final class AddAccountSubmitted extends AddAccountEvent {
  const AddAccountSubmitted({
    required this.name,
    required this.currency,
    required this.accountType,
    required this.initialBalance,
  });

  final String name;
  final String currency;
  final String accountType;
  final String initialBalance;
}
