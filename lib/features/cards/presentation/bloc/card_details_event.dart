sealed class CardDetailsEvent {
  const CardDetailsEvent();
}

final class CardDetailsLoadRequested extends CardDetailsEvent {
  const CardDetailsLoadRequested();
}

final class CardDetailsDeleteRequested extends CardDetailsEvent {
  const CardDetailsDeleteRequested();
}
