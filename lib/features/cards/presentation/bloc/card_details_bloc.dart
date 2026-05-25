import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/cards/domain/entities/card_details.dart';
import 'package:fintech/features/cards/domain/usecases/get_card_details_usecase.dart';
import 'package:fintech/features/cards/presentation/bloc/card_details_event.dart';
import 'package:fintech/features/cards/presentation/bloc/card_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CardDetailsBloc extends Bloc<CardDetailsEvent, CardDetailsState> {
  CardDetailsBloc(
    this._getCardDetailsUseCase,
    @factoryParam this._cardId,
  ) : super(const CardDetailsInitial()) {
    on<CardDetailsLoadRequested>(
      _onLoad,
      transformer: droppable(),
    );
  }

  final GetCardDetailsUseCase _getCardDetailsUseCase;
  final String _cardId;

  Future<void> _onLoad(
    CardDetailsLoadRequested event,
    Emitter<CardDetailsState> emit,
  ) async {
    emit(const CardDetailsLoading());

    final Result<CardDetails> result =
        await _getCardDetailsUseCase(cardId: _cardId);

    switch (result) {
      case Success<CardDetails>(:final value):
        emit(CardDetailsLoaded(value));
      case Error<CardDetails>(:final failure):
        emit(CardDetailsError(failure));
    }
  }
}
