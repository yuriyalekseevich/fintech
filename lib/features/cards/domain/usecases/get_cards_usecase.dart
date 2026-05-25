import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:fintech/features/cards/domain/repositories/cards_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCardsUseCase {
  GetCardsUseCase(this._repository);

  final CardsRepository _repository;

  Future<Result<List<BankCard>>> call() => _repository.getCards();
}
