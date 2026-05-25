import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/cards/domain/entities/card_details.dart';

sealed class CardDetailsState {
  const CardDetailsState();
}

final class CardDetailsInitial extends CardDetailsState {
  const CardDetailsInitial();
}

final class CardDetailsLoading extends CardDetailsState {
  const CardDetailsLoading();
}

final class CardDetailsLoaded extends CardDetailsState {
  const CardDetailsLoaded(this.details);

  final CardDetails details;
}

final class CardDetailsError extends CardDetailsState {
  const CardDetailsError(this.failure);

  final Failure failure;
}
