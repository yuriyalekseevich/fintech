import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/core/domain/failure.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:fintech/features/cards/domain/usecases/create_card_usecase.dart';
import 'package:fintech/features/cards/presentation/bloc/add_card_event.dart';
import 'package:fintech/features/cards/presentation/bloc/add_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc(this._createCardUseCase) : super(const AddCardInitial()) {
    on<AddCardSubmitted>(_onSubmitted, transformer: droppable());
  }

  final CreateCardUseCase _createCardUseCase;

  Map<String, String> fieldErrors = const <String, String>{};

  Future<void> _onSubmitted(
    AddCardSubmitted event,
    Emitter<AddCardState> emit,
  ) async {
    emit(const AddCardSubmitting());
    fieldErrors = const <String, String>{};

    final Result<BankCard> result = await _createCardUseCase(
      cardNumber: event.cardNumber,
      expiryMonth: event.expiryMonth,
      expiryYear: event.expiryYear,
      cvv: event.cvv,
      holderName: event.holderName,
      addressLine1: event.addressLine1,
      addressLine2: event.addressLine2,
      state: event.state,
      zipCode: event.zipCode,
      currency: event.currency,
      type: event.type,
    );

    switch (result) {
      case Success<BankCard>():
        emit(const AddCardSuccess());
      case Error<BankCard>(:final failure):
        if (failure is ValidationFailure) {
          fieldErrors = failure.fieldErrors;
        }
        emit(AddCardFailure(failure));
    }
  }
}
