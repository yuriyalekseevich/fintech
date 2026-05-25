sealed class CardsEvent {
  const CardsEvent();
}

final class CardsLoadRequested extends CardsEvent {
  const CardsLoadRequested();
}

final class CardsRefreshRequested extends CardsEvent {
  const CardsRefreshRequested();
}
