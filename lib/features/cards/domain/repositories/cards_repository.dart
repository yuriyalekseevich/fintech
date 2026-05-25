import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:fintech/features/cards/domain/entities/card_details.dart';

abstract interface class CardsRepository {
  Future<Result<List<BankCard>>> getCards();

  Future<Result<CardDetails>> getCardDetails({required String cardId});
}
