import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';

sealed class CardsState {
  const CardsState();
}

final class CardsInitial extends CardsState {
  const CardsInitial();
}

final class CardsLoading extends CardsState {
  const CardsLoading();
}

final class CardsLoaded extends CardsState {
  const CardsLoaded(this.cards);

  final List<BankCard> cards;
}

final class CardsError extends CardsState {
  const CardsError(this.failure);

  final Failure failure;
}
