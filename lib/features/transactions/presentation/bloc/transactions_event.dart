sealed class TransactionsEvent {
  const TransactionsEvent();
}

final class TransactionsLoadRequested extends TransactionsEvent {
  const TransactionsLoadRequested();
}

final class TransactionsRefreshRequested extends TransactionsEvent {
  const TransactionsRefreshRequested();
}
