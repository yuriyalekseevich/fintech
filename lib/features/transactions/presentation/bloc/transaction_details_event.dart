sealed class TransactionDetailsEvent {
  const TransactionDetailsEvent();
}

final class TransactionDetailsLoadRequested extends TransactionDetailsEvent {
  const TransactionDetailsLoadRequested();
}
