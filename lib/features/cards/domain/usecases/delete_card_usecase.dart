import 'package:fintech/core/domain/resource_id.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/cards/domain/repositories/cards_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCardUseCase {
  DeleteCardUseCase(this._repository);

  final CardsRepository _repository;

  Future<Result<void>> call({required String cardId}) async {
    final String trimmedId = cardId.trim();
    if (!ResourceId.isValid(trimmedId)) {
      return const Error<void>(
        ValidationFailure(message: 'Invalid card identifier'),
      );
    }

    return _repository.deleteCard(cardId: trimmedId);
  }
}
