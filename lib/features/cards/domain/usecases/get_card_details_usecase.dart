import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/cards/domain/entities/card_details.dart';
import 'package:fintech/features/cards/domain/repositories/cards_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCardDetailsUseCase {
  GetCardDetailsUseCase(this._repository);

  final CardsRepository _repository;

  Future<Result<CardDetails>> call({required String cardId}) =>
      _repository.getCardDetails(cardId: cardId);
}
