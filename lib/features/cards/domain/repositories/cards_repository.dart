import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:fintech/features/cards/domain/entities/card_details.dart';
import 'package:fintech/features/cards/domain/requests/create_card_request.dart';

abstract interface class CardsRepository {
  Future<Result<List<BankCard>>> getCards();

  Future<Result<CardDetails>> getCardDetails({required String cardId});

  Future<Result<BankCard>> createCard(CreateCardRequest request);

  Future<Result<void>> deleteCard({required String cardId});
}
