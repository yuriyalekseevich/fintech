import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:fintech/core/domain/result.dart';
import 'package:fintech/features/cards/domain/entities/bank_card.dart';
import 'package:fintech/features/cards/domain/usecases/get_cards_usecase.dart';
import 'package:fintech/features/cards/presentation/bloc/cards_event.dart';
import 'package:fintech/features/cards/presentation/bloc/cards_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc(this._getCardsUseCase) : super(const CardsInitial()) {
    on<CardsLoadRequested>(_onLoad, transformer: droppable());
    on<CardsRefreshRequested>(_onLoad, transformer: droppable());
  }

  final GetCardsUseCase _getCardsUseCase;

  Future<void> _onLoad(CardsEvent event, Emitter<CardsState> emit) async {
    emit(const CardsLoading());

    final Result<List<BankCard>> result = await _getCardsUseCase();

    switch (result) {
      case Success<List<BankCard>>(:final value):
        emit(CardsLoaded(value));
      case Error<List<BankCard>>(:final failure):
        emit(CardsError(failure));
    }
  }
}
