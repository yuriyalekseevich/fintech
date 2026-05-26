import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/validation_result.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:fintech/features/cards/domain/repositories/cards_repository.dart';
import 'package:fintech/features/cards/domain/requests/create_card_request.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateCardUseCase {
  CreateCardUseCase(this._repository);

  final CardsRepository _repository;

  Future<Result<BankCard>> call({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvv,
    required String holderName,
    required String addressLine1,
    String? addressLine2,
    required String state,
    required String zipCode,
    required String currency,
    String type = 'debit',
  }) async {
    final ValidationResult<CreateCardRequest> validation =
        CreateCardRequest.create(
      cardNumber: cardNumber,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      cvv: cvv,
      holderName: holderName,
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      state: state,
      zipCode: zipCode,
      currency: currency,
      type: type,
    );

    return switch (validation) {
      Invalid(:final failure) => Error<BankCard>(failure),
      Valid(:final value) => _repository.createCard(value),
    };
  }
}
